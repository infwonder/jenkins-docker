docker run -d --name jenkins_macbookair -p 192.168.0.3:8080:8080 -v /var/run/docker.sock:/var/run/docker.sock -v /home/jasonlin/Proj/jenkins_home:/var/jenkins_home docker.io/infwonder/jenkins:mine
