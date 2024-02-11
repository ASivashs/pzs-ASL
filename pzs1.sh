#!/bin/bash


# 1 Создать группы пользователей group_iit1, group_iit2.
groupadd group_iit1
groupadd group_iit2

echo 1 Созданы группы пользователей group_iit1, group_iit2


# 2 Создать пользователей iit11, iit12 и добавить их в группу group_iit1.
useradd -g group_iit1 iit11
useradd -g group_iit1 iit12

echo 2 Созданы пользователи iit11, iit12 и добавены в группу group_iit1


# 3 Создать пользователей iit21, iit22 и добавить их в группу group_iit2.
useradd -g group_iit2 iit21
useradd -g group_iit2 iit22

echo 3 Созданы пользователи iit21, iit22 и добавены в группу group_iit2


# 4 Предоставить пользователю iit21 административные привилегии.
usermod -aG sudo iit21

echo 4 Предоставить пользователю iit21 административные привилегии


# 5 Создать пользователя iit3.
useradd iit3

echo 5 Создан пользователь iit3


# 6 Создать папку pzs.
mkdir pzs

echo 6 Создана папка pzs


# 7 Создать папку pzs11 в папке pzs с правами чтения, записи, выполнения только для владельца.
mkdir pzs/pzs11
chmod 700 pzs/pzs11

echo 7 Создана папка pzs11 в папке pzs с правами чтения, записи, выполнения только для владельца


# 8 Создать папку pzs12 в папке pzs с правами чтения, записи, выполнения только для группы.
mkdir pzs/pzs12
chmod 070 pzs/pzs12

echo 8 Создана папка pzs12 в папке pzs с правами чтения, записи, выполнения только для группы


# 9 Создать папку pzs13 в папке pzs c правами чтения, записи, выполнения только для остальных пользователей.
mkdir pzs/pzs13
chmod 007 pzs/pzs13

echo 9 Создана папка pzs13 в папке pzs с правами чтения, записи, выполнения только для остальных пользователей


# 10 Создать папку pzs14 в папке pzs с правами чтения, записи, выполнения для всех пользователей.
mkdir pzs/pzs14
chmod 777 pzs/pzs14

echo 10 Создана папка pzs14 в папке pzs с правами чтения, записи, выполнения только для всех пользователей


# 11 Создать папку pzs15 в папке pzs с правами чтения, записи, выполнения только для администратора (root).
mkdir pzs/pzs15
chmod 700 pzs/pzs15
chown root:root pzs/pzs15

echo "11 Создана папка pzs15 в папке pzs с правами чтения, записи, выполнения только для администратора (root)"


# 12 Сменить текущего пользователя на iit11 
# не работает
su -c iit11

echo 12 Пользователь изменен на iit11


# 13
#---------------------------------------------------------------------------
cd pzs
for dir in pzs11 pzs12 pzs13 pzs14; do
  cd $dir

  # file11 – только с правами чтения только для владельца файла
  echo "echo \"Hello World\"" > file11
  chmod 400 file11
  chown iit11:group_iit1 file11

  # file12 – только с правами чтения, записи только для владельца файла
  echo "echo \"Hello World\"" > file12
  chmod 600 file12
  chown iit11:group_iit1 file12

  # file13 – только с правами записи только для владельца файла
  echo "echo \"Hello World\"" > file13
  chmod 200 file13
  chown iit11:group_iit1 file13

  # file14 – с правами чтения, записи, выполнения только для владельца файла
  echo "echo \"Hello World\"" > file14
  chmod 700 file14
  chown iit11:group_iit1 file14

  # file15 – только с правами выполнения только для владельца файла
  echo "read testVariable" > file15
  chmod 100 file15
  chown iit11:group_iit1 file15

  # file21 – только с правами чтения только для группы пользователей group_iit1
  echo "echo \"Hello World\"" > file21
  chmod 040 file21
  chown iit11:group_iit1 file21

  # file22 – только с правами чтения, записи только для группы пользователей group_iit1
  echo "echo \"Hello World\"" > file22
  chmod 060 file22
  chown iit11:group_iit1 file22

  # file23 – только с правами записи только для группы пользователей group_iit1
  echo "echo \"Hello World\"" > file23
  chmod 020 file23
  chown iit11:group_iit1 file23

  # file24 – с правами чтения, записи, выполнения только для группы пользователей group_iit1
  echo "echo \"Hello World\"" > file24
  chmod 070 file24
  chown iit11:group_iit1 file24

  # file25 – только с правами выполнения только для группы пользователей groupt_iit1
  echo "read testVariable" > file25
  chmod 010 file25
  chown iit11:group_iit1 file25

  # file31 – только с правами чтения только для остальных пользователей
  echo "echo \"Hello World\"" > file31
  chmod 004 file31
  chown iit11:group_iit1 file31

  # file32 – только с правами чтения, записи только для остальных пользователей
  echo "echo \"Hello World\"" > file32
  chmod 006 file32
  chown iit11:group_iit1 file32

  # file33 – только с правами записи только для остальных пользователей
  echo "echo \"Hello World\"" > file33
  chmod 002 file33
  chown iit11:group_iit1 file33

  # file34 – с правами чтения, записи, выполнения только для остальных пользователей
  echo "echo \"Hello World\"" > file34
  chmod 007 file34
  chown iit11:group_iit1 file34

  # file35 – только с правами выполнения только для остальных пользователей
  echo "read testVariable" > file35
  chmod 001 file35
  chown iit11:group_iit1 file35

  # file41 – только с правами чтения для всех пользователей
  echo "echo \"Hello World\"" > file41
  chmod 444 file41
  chown iit11:group_iit1 file41

  # file42 – только с правами чтения, записи для всех пользователей
  echo "echo \"Hello World\"" > file42
  chmod 666 file42
  chown iit11:group_iit1 file42

  # file43 – только с правами записи для всех пользователей
  echo "echo \"Hello World\"" > file43
  chmod 222 file43
  chown iit11:group_iit1 file43

  # file44 – с правами чтения, записи, выполнения для всех пользователей
  echo "echo \"Hello World\"" > file44
  chmod 777 file44
  chown iit11:group_iit1 file44

  # file45 – только с правами выполнения для всех пользователей
  echo "read testVariable" > file45
  chmod 111 file45
  chown iit11:group_iit1 file45

  # file51 – только с правами чтения только для администратора
  echo "echo \"Hello World\"" > file51
  chmod 400 file51
  chown root:root file51

  # file52 – только с правами чтения, записи только для администратора
  echo "echo \"Hello World\"" > file52
  chmod 600 file52
  chown root:root file52

  # file53 – только с правами записи только для администратора
  echo "echo \"Hello World\"" > file53
  chmod 200 file53
  chown root:root file53

  # file54 – с правами чтения, записи, выполнения только для администратора
  echo "echo \"Hello World\"" > file54
  chmod 700 file54
  chown root:root file54

  # file55 – только с правами выполнения только для администратора
  echo "read testVariable" > file55
  chmod 100 file55
  chown root:root file55

  cd ..
  echo dir $dir
  ls -la $dir
  ls -la $dir > $dir.txt
done
#---------------------------------------------------------------------------
