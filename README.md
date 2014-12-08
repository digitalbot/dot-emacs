.emacs.d
=====

My config of emacs for OS X, Linux and Windows.


notice
-----

- this __.emacs.d__ is using _GNU GLOBAL_. And I am setting `MAKEOBJDIRPREFIX`.


usage
-----

```
$ git clone --recursive https://github.com/digitalbot/dot-emacs.git ~/.emacs.d
```

wake up your emacs! and install packages!  

then,

```
$ cd ~/.emacs.d/site-lisp
$ javac Tags.java
$ java -cp $CLASSPATH(you have to set) Tags
```

if you do not have `~/.malabar_mode/classpath`

```
$ mvn -e -X -U classpath.pom dependency:build-classpath
```
