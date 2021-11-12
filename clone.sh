#!/bin/sh

echo "Cloning repositories..."

DEVELOPER=$HOME/Developer
TELEO=$DEVELOPER/teleo
BURKE=$DEVELOPER/burke

# Personal
git clone git@github.com:ToddSmithSalter/newbeginnings.git $DEVELOPER/newbeginnings

# Teleo
git clone git@gitlab.com:teleo-inc/tresel-2.0/tresel.git $TELEO/tresel
git clone git@gitlab.com:teleo-inc/tresel-2.0/docs.git $TELEO/tresel-docs
git clone git@gitlab.com:teleo-inc/tresel-2.0/talon-gateway.git/talon-gateway $TELEO/talon-gateway
git clone git@gitlab.com:teleo-inc/tresel-2.0/talon-os-2.git $TELEO/talon-os-2
git clone git@gitlab.com:teleo-inc/tresel-2.0/tresel-marketing-site.git $TELEO/tresel.io
git clone git@gitlab.com:teleo-inc/tresel-2.0/tresel-sparkplug.git $TELEO/tresel-sparkplug
git clone git@gitlab.com:teleo-inc/tresel-2.0/tresel-monitoring.git $TELEO/tresel-monitoring
git clone git@gitlab.com:teleo-inc/tresel-2.0/tresel-stream.git $TELEO/tresel-stream
git clone git@gitlab.com:teleo-inc/insight/insight.git $TELEO/insight-api
git clone git@gitlab.com:teleo-inc/insight/insight-app.git $TELEO/insight-app
git clone git@gitlab.com:teleo-inc/insight/insight-next.git $TELEO/insight-next
git clone git@gitlab.com:teleo-inc/insight/insight-monitoring.git $TELEO/insight-monitoring
git clone git@gitlab.com:teleo-inc/insight/insight-gateway.git $TELEO/insight-gateway
git clone git@gitlab.com:teleo-inc/burke-calibration/burke-calibration.git $BURKE/admin.burkecalibration.com
git clone git@gitlab.com:teleo-inc/burke-calibration/burke-calibration-frontend.git $BURKE/burkecalibration.com
git clone git@gitlab.com:teleo-inc/burke-calibration/burke-work-orders.git $BURKE/ews.burkecalibration.com
git clone git@gitlab.com:teleo-inc/teleo-projects/country-hills.git $TELEO/countryhills.tresel.io
