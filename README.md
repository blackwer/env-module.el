# env-module.el

Simple wrapper tool to treat your emacs session as a 'environment modules' aware shell. This
allows for emacs subprocesses to call and be aware of the output of `module` commands. This
tool is a bludgeon, not a precision tool. If you don't want to change your entire session,
stick to `shell`, or `ansi-term` for localized needs. Note that while this changes the emacs
session, it does not update existing sub-processes, so existing `term` buffers will keep their
environment, but new shells will inherit the new environment.

To use, add the path to `env-module.el` to your load path and `(require 'env-module)` in your
`init.el` file.

There are two modes of use. When using `eshell`, just use the `module` command directly as you
would in a normal shell (with unfortunately no completion). You can also call `env-module`
directly in lispy form, either via string or a list of arguments: `(env-module 'load 'gcc)` or
`(env-module "load gcc")` should both produce the same result.
