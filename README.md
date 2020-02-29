# woboq-nginx
Web-based code viewer powered by woboq codeviewer.

This project aims to setup a online nginx code viewer by using opensource woboq code viewer.

## Dependencies

  * docker
  * docker-compose
  
## Steps

  1. Run `./compose.sh` to start the container.
     
     Notes that:
     
     * It would be a little longer than usual for the first time since `./compose.sh` will download the ubuntu:latest docker image and build `zongzw/woboq-nginx-image:latest` based on it.
     * Do your own configuration by chaning `docker-compose.yml`, such as: container name, server port, or even image name if you want.
     
   2. Go into the container `woboq-nginx-code-server`:
   
      ```
      docker exec -it woboq-nginx-code-server bash
      ```
      
   3. Run `/root/woboq-nginx/build.sh <your nginx version>`
   
      `/root/woboq-nginx/build.sh` will do:
      
      * download nginx source tar.gz from `http://nginx.org/download/` of specified version.
      
      * untar the source code and build it.
        
        There should be no build error with default compiling option. Also, the dependent library packages have been installed with `Dockerfile`. But if unfortunately, there were building error, please ix it by finding the hints from compiling console output.
        
        The building process will use `bear make`, which will generate the `compile_commands.json` under the code directory. It will be used in the next `generate.sh` step.
        
   4. Run `/root/woboq-nginx/generate.sh` to generate html files under html folder.
    
      The folder is used as nginx static html webroot.
       
   5. Access `http://<your host address>:8024`.
   
      The port can be changed in `docker-compose.yml`, 8024 is link-thought of 1024.
