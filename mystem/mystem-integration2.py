from collections import Counter
from textblob import TextBlob
import pymorphy2

path1 = "_OPEN_"
path2 = "_WRITE_"

f1 = open(path1, "r", encoding="utf8")
f2 = open(path2, "w")

text = f1.read()

# Количество символов в тексте
len_text = len(text)

# Количество слов в тексте
spaces1 = text.split(" ")
spaces2 = text.split("  ")
average_words = len(spaces1) - len(spaces2)

# Количество слов в тексте + лишние символы и пробелы
average_words_fixed = len(text.split(' '))

# pymorphy2
morph = pymorphy2.MorphAnalyzer()
print(morph.parse('крадущийся'))
p = morph.parse('я')[0]
print(p.tag)
print('NOUN' in p.tag)  # существительное
print('VERB' in p.tag)  # глагол
print('ADJF' in p.tag)  # прилагательное
print('NPRO' in p.tag)  # местоимение

print(morph.parse(text)[0].tag)

f1 = open(path1, "r", encoding="utf8")
words = f1.read().replace("\n", " ").replace(".", "").replace(",", "").replace("—", "").split(" ")
print(words)
wlen = len(words)
nouns = 0
verbs = 0
adjfs = 0
npros = 0
for i in range(wlen):
    # print(words[i])
    p = morph.parse(words[i])[0]
    if 'NOUN' in p.tag: nouns += 1
    if 'VERB' in p.tag: verbs += 1
    if 'ADJF' in p.tag: adjfs += 1
    if 'NPRO' in p.tag: npros += 1
    # print(p.tag)
print("Кол-во слов в тексте: ", wlen, file=f2)
print("Кол-во существительных в тексте: ", nouns, nouns/wlen, file=f2)
print("Кол-во прилагательных в тексте: ", adjfs, adjfs/wlen, file=f2)
print("Кол-во местоимений в тексте: ", npros, npros/wlen, file=f2)

# Среднее количество букв в словах текста
average_chars = (len_text - average_words_fixed) / (average_words + 1)
print("Ср. кол-во букв в словах: ", average_chars, file=f2)

# Вывод всех слов
wordcount = Counter(text.replace(".", " CNT").replace("", " CNT").split())
print("Всего знаков препинания: ", wordcount.get('CNT'), wordcount.get("CNT—"),
      wordcount.get("CNT—")/wordcount.get('CNT'), file=f2)

# Среднее количество слов в предложении
with open(path1, encoding='utf8') as f:
    text = f.read()
blob = TextBlob(text)
print("Слов в предложениях в среднем: ", average_words / len((blob.sentences)), file=f2)