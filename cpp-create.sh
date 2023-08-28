#!/bin/bash

# Parse command line arguments
if [[ $# -lt 1 ]]; then
    echo "Usage: $0 <class_name> [-d <directory>]"
    exit 1
fi

class_name=$1
directory="."

if [[ $# -eq 3 && $2 == "-d" ]]; then
    directory=$3
fi

# Generate header file
header_file="$directory/$class_name.hpp"

echo "Generating $header_file..."
upper_class_name=$(echo $class_name | tr '[:lower:]' '[:upper:]')
cat > $header_file << EOF
#ifndef ${upper_class_name}_HPP
#define ${upper_class_name}_HPP

#include <iostream>

class $class_name 
{
public:
    $class_name();
    ~$class_name();
    $class_name(const $class_name& other);
    $class_name& operator=(const $class_name& other);
};

#endif
EOF

# Generate source file
source_file="$directory/$class_name.cpp"

echo "Generating $source_file..."

cat > $source_file << EOF
#include "$class_name.hpp"

$class_name::$class_name() {
    std::cout << "Constructor called for $class_name"<< std::endl;
}

$class_name::~$class_name() {
    std::cout << "Destructor called for $class_name"<< std::endl;
}

$class_name::$class_name(const $class_name& other) {
    std::cout << "Copy constructor called for $class_name"<< std::endl;
}

$class_name& $class_name::operator=(const $class_name& other) {
    std::cout << "Assignment operator called for $class_name" << std::endl;
    if (this != &other) {
        // Copy data here
    }
    return *this;
}
EOF

echo "Done."