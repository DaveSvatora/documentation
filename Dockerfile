FROM squidfunk/mkdocs-material
RUN pip install mkdocs-awesome-pages-plugin \
                mkdocs-git-revision-date-localized-plugin \
                mkdocs-minify-plugin
            
# docker build -t custom/mkdocs-material --force-rm .