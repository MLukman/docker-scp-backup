# docker-scp-backup
Docker image for backup tool that backups files as tar.gz and upload to SCP, as well as download the tar.gz back from SCP and restore the files.

## How to use

    docker run -d --name scp-backup \
        -v volume_or_host_dir_to_backup:/any/path/inside/container \
        -v volume_or_host_dir_to_backup2:/any/path/inside/container2 \
        -v optionally_path_to_priv_key:/any/path/inside/container3 \
        mlukman/docker-scp-backup:latest
        
Then run the `configure` script:

    docker exec -it scp-backup configure
    
Follow the prompts. In particular `Source path` should match one of the container volume mount paths. The `configure` script will attempt to connect to the server and check if the destination path exists.

To run backup:

    docker exec -it scp-backup backup BackupId
    
To restore the backup, first run:

    docker exec -it scp-backup restore BackupId

The script will list down all backup files. Copy the filename that you want to restore and include it in the following command:

    docker exec -it scp-backup restore BackupId TheFileName    
    
