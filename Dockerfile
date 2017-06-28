FROM registry.access.redhat.com/openshift3/jenkins-slave-base-rhel7
MAINTAINER Chris Murphy <chmurphy@redhat.com>

LABEL com.redhat.component="jenkins-slave-skopeo" \
      name="jenkins-slave-skopeo" \
      architecture="x86_64" \
      vendor="Red Hat"
      version="0.0"
      release="1"
      summary="Jenkins Slave With Skopeo Included"
      description="Jenkins Slave With Skopeo Image Management Tool"
### Required labels above - recommended below
      url=""
      io.k8s.display-name="Jenkins Slave With Skopeo Included" \
      io.k8s.description="Jenkins Slave With Skopeo Image Management Tool" \
      io.openshift.tags="openshift,jenkins,slave,skopeo"

RUN yum-config-manager --enable rhel-7-server-extras-rpms && \
    INSTALL_PKGS="skopeo" && \
    yum -y update-minimal --disablerepo "*" --enablerepo rhel-7-server-rpms --setopt=tsflags=nodocs \
      --security --sec-severity=Important --sec-severity=Critical && \
    yum install -y --setopt=tsflags=nodocs $INSTALL_PKGS && \
    rpm -V $INSTALL_PKGS && \
    yum clean all

USER 1111
