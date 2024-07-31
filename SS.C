#include <stdio.h>
#include <string.h>

#define MAX_LENGTH 256


void stuff_message(const char *input, char *output) {
    int i,j=0;
    // Start and end the input with ~
    strcpy(output, "~");
    strcat(output, input);
    strcat(output, "~");

    // Process the output string to add # before ~
    for (i=1; output[i] != '\0'; i++) {
	if (output[i] == '~' && output[i - 1] == '~') {
	    // Shift the rest of the string right to add #
	    for (j = strlen(output); j >= i; j--) {
		output[j + 1] = output[j]; // Shift right
	    }
	    output[i] = '#'; // Insert #
	    i++; // Move past #
	}
    }
}

void destuff_message(const char *stuffed, char *destuffed) {
    int in_message = 0;
    int i,j = 0;

    for ( i = 0; stuffed[i] != '\0'; i++) {
	if (stuffed[i] == '~') {
	    if (in_message) {
		break; // End of the message
	    }
	    in_message = 1; // Start of the message
	} else if (stuffed[i] == '#') {
	    continue; // Ignore #
	} else {
	    if (in_message) {
		destuffed[j++] = stuffed[i]; // Append character to destuffed
	    }
	}
    }
    destuffed[j] = '\0'; // Null-terminate the destuffed string
}

int main() {
    char input[MAX_LENGTH];
    char stuffed[MAX_LENGTH * 2]; // To hold stuffed message
    char destuffed[MAX_LENGTH]; // To hold destuffed message

    // Get user input
    printf("Enter your message: ");
    fgets(input, sizeof(input), stdin);
    input[strcspn(input, "\n")] = 0; // Remove trailing newline

    // Stuff the message
    stuff_message(input, stuffed);
    printf("Stuffed Message: %s\n", stuffed);

    // Destuff the message
    destuff_message(stuffed, destuffed);
    printf("Destuffed Message: %s\n", destuffed);

    return 0;
}
