#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_LINE_COUNT 16
#define MAX_LINE_LENGTH 16

typedef struct node {
    char *value;
    struct node *next;
} node;

void read_logo(char buf[MAX_LINE_COUNT][MAX_LINE_LENGTH], char *filepath) {
    FILE *fp;
    char c;
    int i, j = 0;
    
    fp = fopen(filepath, "r");
    c = getc(fp);
    while (c != EOF) {
        if (c == '\n') {
            j = 0;
            i++;
        } else {
            buf[i][j] = c;
            j++;
        }
        c = getc(fp);
    }
}

node *add_word_to_list(node *list, char word[MAX_LINE_LENGTH]) {
    node *new_head = malloc(sizeof(node));
    new_head->value = malloc(sizeof(char[MAX_LINE_LENGTH]));
    strncpy(new_head->value, word, MAX_LINE_LENGTH);
    new_head->next = list;
    list = new_head;
    return list;
}

node *extract_words(char logo[MAX_LINE_COUNT][MAX_LINE_LENGTH]) {
    node *words = NULL;
    char current_word[MAX_LINE_LENGTH];
    int current_word_length = 0;
    char c;

    // Horizontal
    for (int row = 0; row < MAX_LINE_COUNT; row++) {
        for (int col = 0; col < MAX_LINE_LENGTH; col++) {
            c = logo[row][col];
            if (c == ' ' || c == '\0' || c == '\n') {
                if (current_word_length > 2) {
                    words = add_word_to_list(words, current_word);
                }
                current_word_length = 0;
                memset(current_word, '\0', 16);
            } else {
                current_word[current_word_length] = c;
                current_word_length++;
            }
        }
    }

    // Vertical
    for (int col = 0; col < MAX_LINE_LENGTH; col++) {
        for (int row = 0; row < MAX_LINE_COUNT; row++) {
            c = logo[row][col];
            if (c == ' ' || c == '\0' || c == '\n') {
                if (current_word_length > 2) {
                    words = add_word_to_list(words, current_word);
                }
                current_word_length = 0;
                memset(current_word, '\0', 16);
            } else {
                current_word[current_word_length] = c;
                current_word_length++;
            }
        }
    }

    return words;
}

int main(int argc, char **argv) {
    if (argc != 2) {
        printf("Usage: %s <path_to_logo_file>\n", argv[0]);
        return 0;
    }

    char *filepath = argv[1];
    char logo[MAX_LINE_COUNT][MAX_LINE_LENGTH] = { '\0' };
    read_logo(logo, filepath);
    node *current = extract_words(logo);
    node *temp;

    printf("Words found in %s: ", filepath);
    while (current != NULL) {
        printf("%s, ", current->value);
        temp = current->next;
        free(current);
        current = temp;
    }
    printf("\n");
    free(temp);

    return 0;
}
