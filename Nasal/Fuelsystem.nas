var checkFuel=func() {
	var amount=0.00;
	var target=0.00;
	var pctin=0.00;
	var pctout=0.00;

	var pump5=1;
	var pump6=1;
	var pump7=1;
	var pump8=1;

	var fuelswitch1=1;
	var fuelswitch2=1;
	var fuelswitch3=1;
	var fuelswitch4=1;
	var fuelswitchAPU=1;

	var cross56=1;
	var cross78=1;
	var cross67=1;

	# feeder tank 5 is on engine 1, left outboard #####################################################################
	if (pump5==1) {
		target=getprop("/consumables/fuel/tank[5]/level-lbs");
		if (target<1200) {
			amount=1200-target;
			if (getprop("/consumables/fuel/tank[0]/level-lbs")<amount) {
				amount=getprop("/consumables/fuel/tank[0]/level-lbs");
			}
			setprop("/consumables/fuel/tank[0]/level-lbs",getprop("/consumables/fuel/tank[0]/level-lbs")-amount);
			setprop("/consumables/fuel/tank[5]/level-lbs",getprop("/consumables/fuel/tank[5]/level-lbs")+amount);
		}
	}

	# feeder tank 6 is on engine 2, left inboard ######################################################################
	target=getprop("/consumables/fuel/tank[6]/level-lbs");
	if (target<1200) {
		amount=1200-target;
		if (getprop("/consumables/fuel/tank[0]/level-lbs")<amount) {
			amount=getprop("/consumables/fuel/tank[0]/level-lbs");
		}
		setprop("/consumables/fuel/tank[0]/level-lbs",getprop("/consumables/fuel/tank[0]/level-lbs")-amount);
		setprop("/consumables/fuel/tank[6]/level-lbs",getprop("/consumables/fuel/tank[6]/level-lbs")+amount);
	}

	# feeder tank 7 is on engine 3, right inboard #####################################################################
	target=getprop("/consumables/fuel/tank[7]/level-lbs");
	if (target<1200) {
		amount=1200-target;
		if (getprop("/consumables/fuel/tank[4]/level-lbs")<amount) {
			amount=getprop("/consumables/fuel/tank[1]/level-lbs");
		}
		setprop("/consumables/fuel/tank[4]/level-lbs",getprop("/consumables/fuel/tank[4]/level-lbs")-amount);
		setprop("/consumables/fuel/tank[7]/level-lbs",getprop("/consumables/fuel/tank[7]/level-lbs")+amount);
	}

	# feeder tank 8 is on engine 4, right outboard ####################################################################
	target=getprop("/consumables/fuel/tank[8]/level-lbs");
	if (target<1200) {
		amount=1200-target;
		if (getprop("/consumables/fuel/tank[4]/level-lbs")<amount) {
			amount=getprop("/consumables/fuel/tank[4]/level-lbs");
		}
		setprop("/consumables/fuel/tank[4]/level-lbs",getprop("/consumables/fuel/tank[4]/level-lbs")-amount);
		setprop("/consumables/fuel/tank[8]/level-lbs",getprop("/consumables/fuel/tank[8]/level-lbs")+amount);
	}

	# Now tank 1 into tank 0, left side aux to wing tank ##########################################################
	target=getprop("/consumables/fuel/tank[0]/level-lbs");
	if (target<8120) {
		amount=8120-target;
		if (getprop("/consumables/fuel/tank[1]/level-lbs")<amount) {
			amount=getprop("/consumables/fuel/tank[1]/level-lbs");
		}
		setprop("/consumables/fuel/tank[1]/level-lbs",getprop("/consumables/fuel/tank[1]/level-lbs")-amount);
		setprop("/consumables/fuel/tank[0]/level-lbs",getprop("/consumables/fuel/tank[0]/level-lbs")+amount);
	}

	# Now tank 3 into tank 4, right side aux to wing tank #########################################################
	target=getprop("/consumables/fuel/tank[4]/level-lbs");
	if (target<8120) {
		amount=8120-target;
		if (getprop("/consumables/fuel/tank[3]/level-lbs")<amount) {
			amount=getprop("/consumables/fuel/tank[3]/level-lbs");
		}
		setprop("/consumables/fuel/tank[3]/level-lbs",getprop("/consumables/fuel/tank[3]/level-lbs")-amount);
		setprop("/consumables/fuel/tank[4]/level-lbs",getprop("/consumables/fuel/tank[4]/level-lbs")+amount);
	}

	# Now tank 2 into tank 0, center to left wing tank #######################################################
	target=getprop("/consumables/fuel/tank[0]/level-lbs");
	if (target<8120) {
		amount=8120-target;
		if (getprop("/consumables/fuel/tank[2]/level-lbs")<amount) {
			amount=getprop("/consumables/fuel/tank[2]/level-lbs");
		}
		setprop("/consumables/fuel/tank[2]/level-lbs",getprop("/consumables/fuel/tank[2]/level-lbs")-amount);
		setprop("/consumables/fuel/tank[0]/level-lbs",getprop("/consumables/fuel/tank[0]/level-lbs")+amount);
	}

	# Now tank 2 into tank 4, center to right wing tank ######################################################
	target=getprop("/consumables/fuel/tank[4]/level-lbs");
	if (target<8120) {
		amount=8120-target;
		if (getprop("/consumables/fuel/tank[2]/level-lbs")<amount) {
			amount=getprop("/consumables/fuel/tank[2]/level-lbs");
		}
		setprop("/consumables/fuel/tank[2]/level-lbs",getprop("/consumables/fuel/tank[2]/level-lbs")-amount);
		setprop("/consumables/fuel/tank[4]/level-lbs",getprop("/consumables/fuel/tank[4]/level-lbs")+amount);
	}

	# cross between 5 and 6 to equalize ##########################################################################
	if (cross56==1) {
		amount=0;
		if (getprop("/consumables/fuel/tank[5]/level-lbs") > getprop("/consumables/fuel/tank[6]/level-lbs")) {
			amount=getprop("/consumables/fuel/tank[5]/level-lbs")-getprop("/consumables/fuel/tank[6]/level-lbs");
			amount=amount/2;
			setprop("/consumables/fuel/tank[5]/level-lbs",getprop("/consumables/fuel/tank[5]/level-lbs")-amount);
			setprop("/consumables/fuel/tank[6]/level-lbs",getprop("/consumables/fuel/tank[6]/level-lbs")+amount);
		}
		if (getprop("/consumables/fuel/tank[5]/level-lbs") < getprop("/consumables/fuel/tank[6]/level-lbs")) {
			amount=getprop("/consumables/fuel/tank[6]/level-lbs")-getprop("/consumables/fuel/tank[5]/level-lbs");
			amount=amount/2;
			setprop("/consumables/fuel/tank[6]/level-lbs",getprop("/consumables/fuel/tank[6]/level-lbs")-amount);
			setprop("/consumables/fuel/tank[5]/level-lbs",getprop("/consumables/fuel/tank[5]/level-lbs")+amount);
		}
	}

	# cross between 7 and 8 to equalize ##########################################################################
	if (cross78==1) {
		amount=0;
		if (getprop("/consumables/fuel/tank[7]/level-lbs") > getprop("/consumables/fuel/tank[8]/level-lbs")) {
			amount=getprop("/consumables/fuel/tank[7]/level-lbs")-getprop("/consumables/fuel/tank[8]/level-lbs");
			amount=amount/2;
			setprop("/consumables/fuel/tank[7]/level-lbs",getprop("/consumables/fuel/tank[7]/level-lbs")-amount);
			setprop("/consumables/fuel/tank[8]/level-lbs",getprop("/consumables/fuel/tank[8]/level-lbs")+amount);
		}
		if (getprop("/consumables/fuel/tank[7]/level-lbs") < getprop("/consumables/fuel/tank[8]/level-lbs")) {
			amount=getprop("/consumables/fuel/tank[8]/level-lbs")-getprop("/consumables/fuel/tank[7]/level-lbs");
			amount=amount/2;
			setprop("/consumables/fuel/tank[8]/level-lbs",getprop("/consumables/fuel/tank[8]/level-lbs")-amount);
			setprop("/consumables/fuel/tank[7]/level-lbs",getprop("/consumables/fuel/tank[7]/level-lbs")+amount);
		}
	}

	# cross between 6 and 7 to equalize ##########################################################################
	if (cross67==1) {
		amount=0;
		if (getprop("/consumables/fuel/tank[6]/level-lbs") > getprop("/consumables/fuel/tank[7]/level-lbs")) {
			amount=getprop("/consumables/fuel/tank[6]/level-lbs")-getprop("/consumables/fuel/tank[7]/level-lbs");
			amount=amount/2;
			setprop("/consumables/fuel/tank[6]/level-lbs",getprop("/consumables/fuel/tank[6]/level-lbs")-amount);
			setprop("/consumables/fuel/tank[7]/level-lbs",getprop("/consumables/fuel/tank[7]/level-lbs")+amount);
		}
		if (getprop("/consumables/fuel/tank[6]/level-lbs") < getprop("/consumables/fuel/tank[7]/level-lbs")) {
			amount=getprop("/consumables/fuel/tank[7]/level-lbs")-getprop("/consumables/fuel/tank[6]/level-lbs");
			amount=amount/2;
			setprop("/consumables/fuel/tank[7]/level-lbs",getprop("/consumables/fuel/tank[7]/level-lbs")-amount);
			setprop("/consumables/fuel/tank[6]/level-lbs",getprop("/consumables/fuel/tank[6]/level-lbs")+amount);
		}
	}

	settimer (checkFuel, 1);
}

settimer (checkFuel, 1);

