# To use this repository you need
- Create a bucket in AWS S3 to save your state files
- Change the `bucket` in `project-devops/terraform/aws/us-east-1/infra/terragrunt.hcl`
- Configure access credentials for aws
    - aws_access_key_id
    - aws_secret_access_key
    ```
    $ aws configure --profile profile_name
    ```
- Change the profile_name for terragunt use your credentials you configured in `project-devops/terraform/aws/us-east-1/infra/account-common.hcl`
- Change the directory of the resource you want to create with terraform:
    ```
    $ terragunt init
    ```
- To change the region where you will upload your infrastructure, just change the file in `project-devops/terraform/aws/us-east-1/infra/region-common.hcl`

## Created to organize, structure and facilitate the use of Terraform

# TERRAFORM

## Created to organize, structure and facilitate the use of Terraform

## Requirements
- terraform >= `v0.14.9`
- terragrunt >= `v0.28.16`
- python >= `3.8.3`
- pre-commit >= `2.11.1`

## Install terraform version with tfenv
- Check if the directory already exists:
    ```
    $ ls -la ${HOME}/.tfenv
    ```

- Clone the repository
    ```
    $ git clone https://github.com/tfutils/tfenv.git ~/.tfenv
    ```

- Export patch for:
    <details>
      <summary>bash</summary>

        $ echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> ~/.bashrc
    </details>

    <details>
        <summary>zsh</summary>

        $ echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> ~/.zshrc
    </details>

### Usage
- Install last version
    ```
    $ tfenv install latest
    ```

- Install the latest version release
    ```
    $ tfenv install latest:^0.14
    ```

- List installed version
    ```
    $ tfenv list
    ```

- List remote version
    ```
    $ tfenv list-remote
    ```

- Uninstall
    ```
    $ tfenv uninstall 0.15.0-beta2
    ```

### For more information: [tfenv](https://github.com/tfutils/tfenv)

## Install terragrunt version with tgenv

- Check if the directory already exists:
    ```
    $ ls -la ${HOME}/.tgenv
    ```
- Clone the repository
    ```
    $ git clone https://github.com/cunymatthieu/tgenv.git ~/.tgenv
    ```

- Export patch for:
    <details>
      <summary>bash</summary>

        $ echo 'export PATH="$HOME/.tgenv/bin:$PATH"' >> ~/.bashrc
    </details>

    <details>
        <summary>zsh</summary>

        $ echo 'export PATH="$HOME/.tgenv/bin:$PATH"' >> ~/.zshrc
    </details>

### Usage
- Install last version
    ```
    $ tgenv install latest
    ```

- Install the latest version release
    ```
    $ tgenv install latest:^0.28
    ```

- List installed version
    ```
    $ tgenv list
    ```

- Select a version
    ```
    $ tgenv use 0.28.16
    ```

- For unistall
    ```
    $ tgenv uninstall 0.28.16
    ```

### For more information: [tgenv](https://github.com/cunymatthieu/tgenv)

## Install python version with pyenv
- Check if the directory already exists:
    ```
    $ ls -la ${HOME}/.pyenv
    ```

```
$ git clone https://github.com/pyenv/pyenv.git ~/.pyenv
```

- Export patch for:
    <details>
      <summary>bash</summary>

        $ echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
        $ echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
    </details>

    <details>
        <summary>zsh</summary>

        $ echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
        $ echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
    </details>

### Usage
- List versions
    ```
    $ pyenv install --list
    ```

- Install version
    ```
    $ pyenv install 3.8.0
    ```

- Select local version
    ```
    $ pyenv local 3.8.0

- Select global version
    ```
    $ pyenv global 3.8.0

- Uninstall version
    ```
    $ pyenv uninstall 3.8.0
    ```
### For more information: [pyenv](https://github.com/pyenv/pyenv)

## Install git-crypt
- Install version git-crypt
    ```
    $ git clone git@github.com:AGWA/git-crypt.git
    $ cd git-crypt
    $ make
    $ make install
    ```

- Create file .gitattributes
    ```
    secretfile filter=git-crypt diff=git-crypt
    *.key filter=git-crypt diff=git-crypt
    secretdir/** filter=git-crypt diff=git-crypt
    ```

### For more information: [git-crypt](https://github.com/AGWA/git-crypt)
## Install pre-commit
- Install version python
    ```
    $ pyenv install 3.8.3
    ```

- Select version python
    ```
    $ pyenv global 3.8.3
    ```

- Install pre-commit
    ```
    $ pip install pre-commit
    ```
### Usage
- Pull from pre-commit repos
    ```
    $ pre-commit install --install-hooks --overwrite
    ```

- Auto update
    ```
    $ pre-commit autoupdate
    ```

- Run all files
    ```
    $ pre-commit run --all-files
    ```

    Example commad:
    ```
    aws git:(master) ✗ pre-commit run --all-files
    Terragrunt fmt.......................................(no files to check)Skipped
    Terraform fmt........................................(no files to check)Skipped
    Terraform validate...................................(no files to check)Skipped
    Terraform docs.......................................(no files to check)Skipped
    Terraform validate with tflint.......................(no files to check)Skipped
    Check for merge conflicts................................................Passed
    Trim Trailing Whitespace.................................................Failed
    - hook id: trailing-whitespace
    - exit code: 1
    - files were modified by this hook

    Fixing README.md

    aws git:(master) ✗ pre-commit run --all-files
    Terragrunt fmt.......................................(no files to check)Skipped
    Terraform fmt........................................(no files to check)Skipped
    Terraform validate...................................(no files to check)Skipped
    Terraform docs.......................................(no files to check)Skipped
    Terraform validate with tflint.......................(no files to check)Skipped
    Check for merge conflicts................................................Passed
    Trim Trailing Whitespace.................................................Passed
    ```

- Run all files with commit
    ```
    .terraform git:(master) git commit -am "Alter python version in README.md"
    Terragrunt fmt.......................................(no files to check)Skipped
    Terraform fmt........................................(no files to check)Skipped
    Terraform validate...................................(no files to check)Skipped
    Terraform docs.......................................(no files to check)Skipped
    Terraform validate with tflint.......................(no files to check)Skipped
    Fix End of Files.........................................................Passed
    Check docstring is first.............................(no files to check)Skipped
    Check JSON...........................................(no files to check)Skipped
    Check Yaml...........................................(no files to check)Skipped
    Debug Statements (Python)............................(no files to check)Skipped
    Fix requirements.txt.................................(no files to check)Skipped
    Fix double quoted strings............................(no files to check)Skipped
    Check for merge conflicts................................................Passed
    Trim Trailing Whitespace.................................................Passed
    Mixed line ending........................................................Passed
    [master 6f5c929] Alter python version in README.md
    1 file changed, 1 insertion(+), 1 deletion(-)
    ```
### For more information: [pre-commit](https://pypi.org/project/pre-commit/)
