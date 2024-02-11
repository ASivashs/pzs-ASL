#!/bin/bash


# 17
# Удалить созданные файлы, папки, пользователей iit11, iit12, iit21, iit22, iit3,
# группы groupt_iit1, group_iit2
rm -r pzs

userdel -r iit11
userdel -r iit12
userdel -r iit21
userdel -r iit22
userdel -r iit3

groupdel group_iit1
groupdel group_iit2
