#include <stdio.h>
#include <string.h>

#if defined(__linux__)
#define PICKLE_PLATFORM "linux"
#elif defined(__APPLE__)
#define PICKLE_PLATFORM "macos"
#elif defined(_WIN32)
#define PICKLE_PLATFORM "windows"
#else
#define PICKLE_PLATFORM "cosmopolitan"
#endif

static void print_banner(void) {
    puts("PickleOS / PickleAI");
    puts("Unified agent environment");
    printf("Host target: %s\n", PICKLE_PLATFORM);
    puts("Type help for commands.\n");
}

static void print_help(void) {
    puts("Commands:");
    puts("  status   Show runtime status");
    puts("  about    Show the PickleOS architecture");
    puts("  help     Show this help");
    puts("  exit     Leave PickleOS");
}

static void print_about(void) {
    puts("PickleOS uses one PickleAI core with multiple runtime layers:");
    puts("  host:   Windows/Linux/macOS application mode");
    puts("  boot:   future BIOS/UEFI minimal runtime mode");
    puts("  model:  shared inference and agent services");
    puts("This foundation intentionally does not claim to be a complete OS yet.");
}

int main(void) {
    char command[256];

    print_banner();
    for (;;) {
        fputs("pickle> ", stdout);
        fflush(stdout);

        if (!fgets(command, sizeof(command), stdin)) {
            putchar('\n');
            break;
        }

        command[strcspn(command, "\r\n")] = '\0';

        if (strcmp(command, "exit") == 0 || strcmp(command, "quit") == 0) {
            puts("Shutting down PickleOS.");
            break;
        } else if (strcmp(command, "help") == 0) {
            print_help();
        } else if (strcmp(command, "status") == 0) {
            puts("runtime=host-shell");
            puts("agent=shared-core-planned");
            puts("boot-runtime=foundation-only");
        } else if (strcmp(command, "about") == 0) {
            print_about();
        } else if (command[0] != '\0') {
            puts("Unknown command. Type help.");
        }
    }

    return 0;
}
