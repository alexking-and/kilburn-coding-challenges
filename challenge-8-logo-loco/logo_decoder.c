#include <stdio.h>

#define MAX_LINE_COUNT 16
#define MAX_LINE_LENGTH 16

typedef struct node {
    char *value;
    node *next;
} node;

int main(int argc, char **argv) {
    char *filepaths[5] = {"./data/logo1.txt", "./data/logo2.txt", "./data/logo3.txt", "./data/logo4.txt", "./data/logo5.txt"};

    for (int i = 0; i < 5; i++) {
        node *current = extract_words(read_logo(filepaths[i]));

        printf("Words found in %s: ", filepaths[i]);
        while (current != NULL) {
            printf("%s, ", current->value);
            current = current->next;
        }
        printf("\n");
    }
    
    printf("\n");
}

char **read_logo(char *filepath) {
    FILE *fp;
    char c;
    int i, j;
    char logo[MAX_LINE_COUNT][MAX_LINE_LENGTH];
    
    fp = fopen(filepath, 'r');
    c = getc(fp);
    while (c != EOF) {
        if (c == '\n') {
            i = 0;
            j++;
        } else {
            logo[i][j] = c;
            i++;
        }
        c = getc(fp);
    }

    return logo;
}

node *extract_words(char **logo) {
    /*
        Keep linked list of words
        scan both horizontally and vertically
        If >2 chars next to each other, whole sequence is a word
    */
}
