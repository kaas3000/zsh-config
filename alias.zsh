alias ll='ls -Fla'
alias fip="rg -uuu -i \
            --glob='!**/.idea/**'  \
            --glob='!**/old-repos/**'  \
            --glob='!**/builds/**' \
            --glob='!**/public/**' \
            --glob='!**/output/**' \
            --glob='!**/build/**' \
            --glob='!**/backup-builds/**' \
            --glob='!**/node_modules/**' \
            --glob='!**/coverage/**' \
            --glob='!**/.git/**' \
            --glob='!**/.mypy_cache/**' \
            --glob='!**/.phpunit.result.cache' \
            --glob='!**/.phpcs-cache' \
            $HOME/projects/vagrant-development-environment/projects \
            -e"

# Vagrant shortcuts
alias vag="ssh webdev@127.0.0.1 -p 2222 -i $HOME/.vagrant.d/insecure_private_key"
alias err-web="clear && ssh webdev@127.0.0.1 -p 2222 -i $HOME/.vagrant.d/insecure_private_key 'tail -f --lines 0 \$HOME/logs/nginx/ysp.dev.ysp.cloud-error.log'"
alias err-bac="clear && ssh webdev@127.0.0.1 -p 2222 -i $HOME/.vagrant.d/insecure_private_key 'tail -f --lines 0 \$HOME/logs/nginx/backoffice.dev.ysp.cloud-error.log'"
alias err-yspim="clear && ssh webdev@127.0.0.1 -p 2222 -i $HOME/.vagrant.d/insecure_private_key 'tail -f --lines 0 /var/log/nginx/images.dev.ysp.cloud-error.log'"

