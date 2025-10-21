#!/bin/sh

echo "Cloning repositories..."

HERD=$HOME/Herd
TELEO=$HERD/teleo
BURKE=$HERD/burke

# Personal
git clone git@github.com:ToddSmithSalter/newbeginnings.git $HERD/newbeginnings

# Teleo
git clone git@gitlab.com:teleo-inc/tresel-2.0/tresel.git $TELEO/tresel
git clone git@gitlab.com:teleo-inc/tresel-2.0/docs.git $TELEO/tresel-docs
git clone git@gitlab.com:teleo-inc/tresel-2.0/talon-gateway.git $TELEO/talon-gateway
git clone git@gitlab.com:teleo-inc/tresel-2.0/talon-os-2.git $TELEO/talon-os-2
git clone git@gitlab.com:teleo-inc/tresel-2.0/tresel-marketing-site.git $TELEO/tresel
git clone git@gitlab.com:teleo-inc/tresel-2.0/tresel-sparkplug.git $TELEO/tresel-sparkplug
git clone git@gitlab.com:teleo-inc/tresel-2.0/tresel-monitoring.git $TELEO/tresel-monitoring
git clone git@gitlab.com:teleo-inc/tresel-2.0/tresel-stream.git $TELEO/tresel-stream
git clone git@gitlab.com:teleo-inc/burke-calibration/burke-calibration.git $BURKE/admin.burkecalibration
git clone git@gitlab.com:teleo-inc/burke-calibration/burke-calibration-frontend.git $BURKE/burkecalibration
git clone git@gitlab.com:teleo-inc/burke-calibration/burke-work-orders.git $BURKE/c-trac
git clone git@gitlab.com:teleo-inc/teleo-projects/country-hills.git $TELEO/countryhills.tresel.io
