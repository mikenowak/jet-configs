divert(-1)
#
# Copyright (c) 1983 Eric P. Allman
# Copyright (c) 1988, 1993
#       The Regents of the University of California.  All rights reserved.
#
# Copyright 2009 Sun Microsystems, Inc.  All rights reserved.
# Use is subject to license terms.
#
#ident  "@(#)sendmail.mc        1.12    10/03/24 SMI"
#
#  This is a configuration file for SunOS 5.8 (a.k.a. Solaris 8) and later
#  subsidiary machines.  It has support for local and SMTP mail.  The
#  confFALLBACK_SMARTHOST macro is enabled, which means that messages will
#  be sent to that host (which is set to mailhost.$m [$m is the local domain])
#  if MX records are unavailable.  A short-cut rule is also defined, which
#  says if the recipient host is in the local domain, send to it directly
#  instead of the smart host.
#
#  Additionally sendmail is set configured to listen on localhost only, and a
#  few privacy options are enabled just in case.
#
#
#  If you want to customize this further, copy it to a name appropriate
#  for your environment and do the modifications there.
#

divert(0)dnl
VERSIONID(`sendmail.mc (Sun)')
OSTYPE(`solaris8')dnl
DOMAIN(`solaris-generic')dnl
define(`confFALLBACK_SMARTHOST', `mailhost$?m.$m$.')dnl
define(`SMART_HOST', `mailhost$?m.$m$.')dnl
define(`confPRIVACY_FLAGS', `noexpn,novrfy')dnl
define(`confSMTP_LOGIN_MSG', `E-mail Server Ready')dnl
FEATURE(`no_default_msa')dnl
DAEMON_OPTIONS(`Name=NoMTA4, Family=inet, Addr=127.0.0.1')dnl
DAEMON_OPTIONS(`Name=MSA4,   Family=inet, Addr=127.0.0.1, Port=587, M=E')dnl
MAILER(`local')dnl
MAILER(`smtp')dnl