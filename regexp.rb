# _*_ coding:utf-8 *_*
str = "あああテスト手巣都"

#m = str.scan(/\p{Hiragana}/)#ひらがなの正規表現
#m = str.scan(/\p{Katakana}/)#カタカナの正規表現
m = str.match(/[一-龠々]/)#漢字の正規表現

p m