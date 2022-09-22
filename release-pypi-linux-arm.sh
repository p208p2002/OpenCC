for VERSION in 3.7.14 3.8.14 3.9.14 3.10.7; do
    docker run --rm -ti --platform linux/arm64/v8 -v $PWD:/opencc python:$VERSION sh -c "cd opencc && sh build-wheel-linux-arm.sh"  
done

# Upload to PyPI
python -m pip install twine
python -m twine upload --repository testpypi dist/*
