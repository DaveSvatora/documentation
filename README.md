# documentation
My personal documentation site

## Local

> RUN

```
docker run --rm -it -p 8000:8000 -v ${PWD}:/docs squidfunk/mkdocs-material
```

> BUILD

```
docker run --rm -it -v ${PWD}:/docs squidfunk/mkdocs-material build
```

## Deploying

1. Go to the root directory of this project

    ```
    cd ~/Documents/documentation
    ```

2. Clean out the public folder

    ```
    rm -rf public
    ```

3. Generate the site
    
    ```
    hugo
    ```

4. Remove the current site

    ```
    rm -rf ~/Documents/DaveSvatora.github.io/*
    ```

5. Copy the contents of public to the git folder

    ```
    cp -r ~/Documents/documentation/public/. ~/Documents/DaveSvatora.github.io/
    ```

6. Cd to git pages git branch

    ```
    cd ~/Documents/DaveSvatora.github.io/
    ```

7. Stage Git

    ```
    git add .
    ```

8. Git commit

    ```
    git commit -m "automated commit"
    ```

9. Push

    ```
    git push
    ```