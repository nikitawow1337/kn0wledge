#!/usr/bin/env python
# -*- coding: utf-8 -*-

from pymystem3 import Mystem
from collections import Counter
from textblob import TextBlob
from textblob import Word
import random

file1_path = "FILE1_READ_PATH"
file2_path = "FILE2_WRITE_PATH"

file1 = open(file1_path, "r", encoding="utf8")
file2 = open(file2_path, "w")

file2.write(str(file1))
file2.write("\n")

text = file1.read()

# Количество символов в тексте
len_text = len(text)
print("Символов: ", len_text, file=file2)

# Количество слов в тексте
spaces1 = text.split(" ")
spaces2 = text.split("  ")
average_words = len(spaces1) - len(spaces2)
print("Кол-во слов в тексте: ", average_words, file=file2)

# Количество слов в тексте + лишние символы и пробелы
average_words_fixed = len(text.split(' '))
print("Кол-во слов в тексте + пробелы: ", average_words_fixed, file=file2)

# Среднее количество букв в словах текста
average_chars = (len_text - average_words_fixed) / (average_words + 1)
print("Ср. кол-во букв: ", average_chars, file=file2)

# Среднее количество слов в предложении
with open(file1_path, encoding='utf8') as f:
    text = f.read()
blob = TextBlob(text)
print("Предложений: ", len((blob.sentences)), file=file2)
print("Слов в предложениях в среднем: ", average_words / len((blob.sentences)), file=file2)

# Подсчет длинных слов
wordcount = Counter(text.split())
print("Слова: ", wordcount, file=file2)
c_count1 = 0
c_count2 = 0
for item in wordcount.items():
    if len(item[0]) >= 10:
        c_count1 += 1
    if len(item[0]) >= 15:
        c_count2 += 1
print("Длинные слова >= 10: ", c_count1, file=file2)
print("Длинные слова >= 15: ", c_count2, file=file2)
print("Длинные слова >= 10 / всего слов", c_count1 / average_words, file=file2)
print("Длинные слова >= 15 / всего слов", c_count2 / average_words, file=file2)

# Подсчет и вывод слов
for item in wordcount.items():
    # print("{}\t{}".format(*item))
    file2.write("{}\t{}\n".format(*item))

file1.close()
file2.close()
