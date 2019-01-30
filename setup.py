# -*- coding: utf-8 -*-
try:
    from setuptools import setup
except ImportError:
    from distutils.core import setup
import subprocess

import six

git_version = 'UNKNOWN'
try:
    if six.PY2:
        git_version = str(subprocess.check_output(['git', 'rev-parse', '--verify', '--short', 'HEAD'])).strip()
    if six.PY3:
        git_version = subprocess.check_output(['git', 'rev-parse', '--verify', '--short', 'HEAD']).strip().decode('ascii')
except subprocess.CalledProcessError:
    pass

setup(
    name='holvirc',
    #version='0.2.1dev-%s' % git_version,
    version='0.1.20190130',
    author='Eero "rambo" af Heurlin',
    author_email='rambo@iki.fi',
    packages=['holvirc', 'holvirc.tests'],
    license='MIT',
    long_description=open('README.md').read(),
    description='Remote-Control Holvi via Selenium',
    install_requires=list(filter(bool, (x.strip() for x in open('requirements.txt').readlines()))),
    url='https://github.com/rambo/python-holvirc',
)
