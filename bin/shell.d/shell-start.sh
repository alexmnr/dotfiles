#!/bin/bash
sudo systemctl start sshd.service
sudo systemctl start httpd.service
sleep 5
ssh localhost -p 42069
