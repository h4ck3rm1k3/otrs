# --
# AAASupport.pm - config to bind STDERR to an log file usable for Support
# Copyright (C) 2001-2007 OTRS GmbH, http://otrs.org/
# --
# $Id: AAASupport.pm,v 1.1 2007/07/11 12:31:04 sr Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl.txt.
# --

    if ($ENV{HTTP_USER_AGENT}) {
        # check log file size
        my $Size = -s $Self->{Home}."/var/log/support.log";
        if ($Size > 20*1024*1024) {
            unlink $Self->{Home}."/var/log/support.log";
        }
        # create tmp file handle
        open(OLDOUT, ">&STDERR");
        # move STDOUT to tmp file
        if (!open(STDERR, ">> ".$Self->{Home}."/var/log/support.log")) {
            print STDERR "ERROR: Can't write $Self->{Home}/var/log/support.log: $!";
        }
        # restore STDOUT file handle
#       open(STDOUT, ">&OLDOUT");
        close(OLDOUT);
    }

1;