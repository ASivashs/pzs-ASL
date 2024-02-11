#!/bin/bash


# 17
# Удалить созданные файлы, папки, пользователей iit11, iit12, iit21, iit22, iit3,
# группы groupt_iit1, group_iit2
rm -r pzs

userdel iit11
userdel iit12
userdel iit21
userdel iit22
userdel iit3

groupdel group_iit1
groupdel group_iit2
