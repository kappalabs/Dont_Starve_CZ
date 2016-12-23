#!/bin/bash

# Konstanty pro překlad základu hry + RoG + SW
tgdir="czechlanguage/"
lang_orig="czech.po"
lang_tmp="czech.po.tmp"
lang_ascii_tg="${tgdir}czech_ascii.po"
lang_tg="${tgdir}czech.po"

# Konstanty pro překlad DS Together
tgdir_dst="czechlanguage_dst/"
lang_dst_orig="czech_dst.po"
lang_dst_tmp="czech_dst.po.tmp"
lang_dst_ascii_tg="${tgdir_dst}czech_dst_ascii.po"
lang_dst_tg="${tgdir_dst}czech_dst.po"

pre_encoding="UTF-8"
post_encodingc="iso-8859-2"
separator="-#&#-"


##############################
# Překlad základu + RoG + SW #
##############################

# Konvertování souboru překladu do kódování ASCII
iconv -c --from utf8 --to ascii//TRANSLIT "${lang_orig}" >"${lang_tmp}"
sed -i "s/${pre_encoding}/${post_encodingc}/g" "${lang_tmp}"

# Připrav speciální typ řetezců pro záměnu textů (featura "c") ve hře
javac "Uprav.java"
java -Dfile.encoding="${post_encodingc}" "Uprav" "${lang_tmp}" "${lang_ascii_tg}" "${separator}"

# Úprava kódování souboru ".po" k publikaci
cp "${lang_orig}" "${lang_tmp}"
recode UTF-8..latin-2 "${lang_tmp}"
sed -i "s/${pre_encoding}/${post_encodingc}/g" "${lang_tmp}"
java -Dfile.encoding="${post_encodingc}" "Uprav" "${lang_tmp}" "${lang_tg}" "${separator}"


###############
# Překlad DST #
###############

# Překlad v ASCII bez diakritiky
iconv -c --from utf8 --to ascii//TRANSLIT "${lang_dst_orig}" >"${lang_dst_tmp}"
sed -i "s/${pre_encoding}/${post_encodingc}/g" "${lang_dst_tmp}"

cp "${lang_dst_tmp}" "${lang_dst_ascii_tg}"

# Překlad s diakritikou
cp "${lang_dst_orig}" "${lang_dst_tmp}"
recode UTF-8..latin-2 "${lang_dst_tmp}"
sed -i "s/${pre_encoding}/${post_encodingc}/g" "${lang_dst_tmp}"

cp "${lang_dst_tmp}" "${lang_dst_tg}"


#############
# Dokončení #
#############

# Úklid
rm "Uprav.class" "${lang_tmp}" "${lang_dst_tmp}"

echo "Příkaz dokončen."
