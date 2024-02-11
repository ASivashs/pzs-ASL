#!/bin/bash


# 16
# В каждой из созданных папок проверить, можно ли прочитать содержимое
# папок, создать новые файлы, удалить каждый из существующих файлов
for dir in pzs11 pzs12 pzs13 pzs14 pzs15; do
  cd $dir
  for user in iit11 iit12 iit21 iit22 iit3 root; do
    echo "User $user:"

    # Read
    su $user -c "ls" 
    if [ $? -eq 0 ]; then
      echo "Can read $dir"
    else
      echo "Cannot read $dir"
    fi

    # Write
    su $user -c "touch test" 
    if [ $? -eq 0 ]; then
      echo "Can create new file in $dir"
      rm test
    else
      echo "Cannot create new file in $dir"
    fi

    # Delete
    su $user -c "rm file11" 
    if [ $? -eq 0 ]; then
      echo "Can delete file in $dir"
    else
      echo "Cannot delete file in $dir"
    fi

    echo "-----------------"
  done
  echo "+++++++++++++++++"
done
