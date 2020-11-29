#include <stdio.h>
#include <stdbool.h>
#include <string.h>

#define DICTIONARY_SIZE 172820
#define DICTIONARY_PATH "../data/dict.txt"
#define MAX_WORD_LENGTH 32

typedef struct node {
    char *value;
    node *left, *right;
} node;

void main() {
    char *dictArray = readDictionaryIntoArray();
    node *dictTree = dictionaryArrayIntoTree(dictArray);
    printf(longestValidSubstring(dictTree, "dictionorie"));
}

bool isWordValid(node *dictNode, char *word) {
    if (dictNode == NULL) {
        return false;
    }
    
    int diff = strcmp(dictNode->value, word);
    if (diff == 0) {
        return true;
    } else if (diff < 0) {
        return isWordValid(dictNode->right, word);
    } else {
        return isWordValid(dictNode->left, word);
    }
}

char *longestValidSubstring(node *dictNode, char *word) {
    for (int i = sizeof(word) / sizeof(word[0]); i > 0; i--) {
        // isWordValid(string slice)
    }
    return "";
}

char **readDictionaryIntoArray() {
    char words[DICTIONARY_SIZE][MAX_WORD_LENGTH];
    FILE *fptr = fopen(DICTIONARY_PATH, "r");
    char c;
    bool eol = false;
    for (int i = 0; i < DICTIONARY_SIZE; i++) {
        int j = 0;
        while (!eol) {
            c = fgetc(fptr);
            if (c == '\n') {
                words[i][j] = '\0';
                eol = true;
            } else {
                words[i][j] = c;
            }
            j++;
        }
    }
    return words;
}

node *dictionaryArrayIntoTree(char **dictArray, int startIndex, int endIndex) {
    if (strcmp(dictArray[startIndex], dictArray[endIndex]) > 0) {
        return NULL;
    }

    int midIndex = (startIndex + endIndex) / 2;
    node *root = // Nope this ends here
    // C is just not the vibe I need right now
}

int testFunction() {
    return 1337;
}
