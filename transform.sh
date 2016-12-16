#!/bin/bash
tgdir="czechlanguage/"
lang_orig="czech.po"
lang_tmp="czech.po.tmp"
lang_ascii_tg="${tgdir}czech_ascii.po"
lang_tg="${tgdir}czech.po"
pre_encoding="UTF-8"
post_encodingc="iso-8859-2"
separator="-#&#-"

# Konvertovani souboru prekladu do kodovani ASCII
iconv -c --from utf8 --to ascii//TRANSLIT "${lang_orig}" >"${lang_tmp}"
sed -i "s/${pre_encoding}/${post_encodingc}/g" "${lang_tmp}"

# Priprav specialni typ retezcu pro zamenu textu (featura "c") ve hre
javac "Uprav.java"
java -Dfile.encoding="${post_encodingc}" "Uprav" "${lang_tmp}" "${lang_ascii_tg}" "${separator}"

# Uprava kodovani souboru czech.po k publikaci
cp "${lang_orig}" "${lang_tmp}"
recode UTF-8..latin-2 "${lang_tmp}"
sed -i "s/${pre_encoding}/${post_encodingc}/g" "${lang_tmp}"
java -Dfile.encoding="${post_encodingc}" "Uprav" "${lang_tmp}" "${lang_tg}" "${separator}"

# Uklid
rm "Uprav.class" "${lang_tmp}"

echo "Prikaz dokoncen."
