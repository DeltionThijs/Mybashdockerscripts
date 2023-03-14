#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <time.h>
#include <utmp.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/types.h>

#define LOG_FILE "/var/log/userlog"

int main()
{
    pid_t pid, sid;

    pid = fork();

    if (pid < 0) {
        exit(EXIT_FAILURE);
    }

    if (pid > 0) {
        exit(EXIT_SUCCESS);
    }

    umask(0);

    sid = setsid();

    if (sid < 0) {
        exit(EXIT_FAILURE);
    }

    if ((chdir("/")) < 0) {
        exit(EXIT_FAILURE);
    }

    close(STDIN_FILENO);
    close(STDOUT_FILENO);
    close(STDERR_FILENO);

    while (1) {
        time_t t = time(NULL);
        struct utmp *utmpdata;
        int utmpfd;

        if ((utmpfd = open("/var/run/utmp", O_RDONLY)) < 0) {
            perror("Error opening utmp file");
            exit(EXIT_FAILURE);
        }

        while ((utmpdata = getutent()) != NULL) {
            if (utmpdata->ut_type == USER_PROCESS) {
                FILE *log_file = fopen(LOG_FILE, "a");

                if (log_file == NULL) {
                    perror("Error opening log file");
                    exit(EXIT_FAILURE);
                }

                char *login_time = ctime(&(utmpdata->ut_tv.tv_sec));
                char *username = utmpdata->ut_user;

                fprintf(log_file, "%s: %s logged in\n", login_time, username);
                fclose(log_file);
            }
        }

        endutent();
        close(utmpfd);

        sleep(300);
    }

    exit(EXIT_SUCCESS);
}
