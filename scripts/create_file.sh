#!/bin/bash

fileName=$(echo $1 | rg -o "(.+)\.(.+)" -r '$1')
fileType=$(echo $1 | rg -o "(.+)\.(.+)" -r '$2')

touch $fileName.$fileType

case $fileType in

java) echo -e "\
import java.util.*;

public class $fileName {
	public static void main(String[] args) {

	}
}" > $fileName.$fileType;;

c) echo -e "\
#include <stdio.h>
#include <stlib.h>

int main() {

}" > $fileName.$fileType;;

rs) echo -e "\
fn main() {

}" > $fileName.$fileType;;

esac

nvim $fileName.$fileType
