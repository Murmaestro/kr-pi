Create a source distribution with the following command at the root directory
`python setup.py sdist --formats=gztar`

Then copy the `tar.gz` file to the pi as the pi user.

Change the file permission of the `configure_HelloPython` script to be executable

Finally, simply run the script.

There is no need to execute `pip install .` because this is ultimately a systemd service,
not a python package to be included in another python application.
