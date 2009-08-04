# --
# Kernel/Language/fr_GeneralCatalog.pm - the french translation of GeneralCatalog
# Copyright (C) 2001-2009 Olivier Sallou <olivier.sallou at irisa.fr>
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# --
# $Id: fr_GeneralCatalog.pm,v 1.2 2009/08/04 12:29:01 ub Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::fr_GeneralCatalog;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.2 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'General Catalog'}            = 'Catalogue G�n�ral';
    $Lang->{'General Catalog Management'} = 'Gestion du Catalogue G�n�ral';
    $Lang->{'Catalog Class'}              = 'Classe de Catalogue';
    $Lang->{'Add a new Catalog Class.'}   = 'Ajouter une nouvelle classes de Catalogue.';
    $Lang->{'Add Catalog Item'}           = 'Ajouter un Element au Catalogue';
    $Lang->{'Add Catalog Class'}          = 'Ajouter une Classe de Catalogue';
    $Lang->{'Functionality'}              = 'Fonctionnalit�';

    return 1;
}

1;
