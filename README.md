# docker-sphinx quickstart

## Steps to create sphinx documentation:-

1. Pull the docker image.

    ```bash
    docker pull anmoljh/docker-sphinx:1.0
    ```

2. Create a document directory.

    ```bash
    mkdir -p $HOME/sphinx-docs
    ```

3. Run docker container to initialize the sphinx document.


    ```bash
    docker run -it \
               --rm \
               --volume $HOME/sphinx-docs:/opt/sphinx-docs  \
               --env SPHINX_PROJECT_NAME="DemoProject" \
               --env SPHINX_AUTHOR_NAME="AH" \
               anmoljh/docker-sphinx:1.0
    ```

    **Note:-**

         - Replace the Project_name "DemoProject" and Author_name "AH" of your choice.
         - Don't include "SPACES" in the Project_name.

4. Visualize the sphinx documents.

    - Html documents are generated at $HOME/sphinx-docs/`SPHINX_PROJECT_NAME`/docs/build/html
      directory.
    - Go the directory and open the index.rst file in any browser.

    **Note:-**

         - SPHINX_PROJECT_NAME is set to your Project_name.
         - Don't include "SPACES" in the Project_name.

5. Add contents to the sphinx documents.

    - Edit files at $HOME/sphinx-docs/SPHINX_PROJECT_NAME/docs/source directory.
    - Re-run docker container (See step 3) to re-generate html files.
    - Visualize the sphinx documents as done before (See step 4).
