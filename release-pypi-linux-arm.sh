sudo apt-get install python3 python3-pip
sudo apt-get install qemu binfmt-support qemu-user-static # Install the qemu packages
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes

for VERSION in 3.7.14 3.8.14 3.9.14 3.10.7; do
    docker run --rm -ti --platform linux/arm64/v8 -v $PWD:/opencc python:$VERSION sh -c "cd opencc && sh build-wheel-linux-arm.sh"  
done

# Upload to PyPI
python3 -m pip install twine
python3 -m twine upload --repository testpypi dist/*
