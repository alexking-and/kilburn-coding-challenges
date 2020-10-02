#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#include <emscripten/emscripten.h>

#define DICTIONARY_SIZE 172820
#define DICTIONARY_PATH "../data/dict.txt"
#define MAX_WORD_LENGTH 32

struct node {
    char *value;
    node *left, *right;
} node;

bool EMSCRIPTEN_KEEPALIVE isWordValid(node *dictNode, char *word) {
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

char EMSCRIPTEN_KEEPALIVE *longestValidSubstring(node *dictNode, char *word) {
    for (int i = sizeof(word) / sizeof(word[0]); i > 0; i--) {
        // isWordValid(string slice)
    }
    return "";
}

char EMSCRIPTEN_KEEPALIVE *readDictionaryIntoArray() {
    char words[DICTIONARY_SIZE][MAX_WORD_LENGTH];
    FILE *fptr = fopen(DICTIONARY_PATH, "r");
    char c;
    bool eof = false;
    for (int i = 0; i < DICTIONARY_SIZE; i++) {
        
    }
}

node EMSCRIPTEN_KEEPALIVE *dictionaryArrayIntoTree(char *dictArray) {

}

int EMSCRIPTEN_KEEPALIVE testFunction() {
    return 1337;
}
