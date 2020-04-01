FROM jupyterhub/jupyterhub:latest

# Add notebook modules
RUN pip install notebook
RUN pip install numpy scipy

# Generate default configuration
RUN mkdir /etc/jupyterhub
RUN env -C /etc/jupyterhub jupyterhub --generate-config

# Add sample users
RUN useradd -m user1 -s /bin/bash -p "IBYPkWyNvQ4Yo"
RUN useradd -m user2 -s /bin/bash -p "AgFd43c9zUDwc"
RUN useradd -m user3 -s /bin/bash -p "ZilU8izBUiOpc"

# Add sample admin users
RUN useradd -m admin1 -s /bin/bash -p "ChFOlpG5lYZ22"
RUN useradd -m admin2 -s /bin/bash -p "zek/wLLX0E.eQ"
RUN useradd -m admin3 -s /bin/bash -p "KXUP4Vp8iNfEI"

RUN echo "c.Authenticator.admin_users = {'admin1', 'admin2', 'admin3'}" \
    >> /etc/jupyterhub/jupyterhub_config.py
RUN echo "c.JupyterHub.admin_access" >> /etc/jupyterhub/jupyterhub_config.py

# TODO: set up SSL