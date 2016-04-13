#!/usr/bin/python

import glob, os, math
from datetime import time, datetime
from jdcal import gcal2jd

round_to = 3
granule_uid = 1 # start value, will be incremented line by line

value_sep = "  "
value_null = "NULL"
float_null = "9999.9999"
date_null = "1900-01-01"

today_date = str(datetime.today()).split()[0]

data_base_url = "ftp://amda-idis.oeaw.ac.at/MAG/VSO/"
data_base_dir = "/home/talubaidi/vexmag/"  # data files must be here

os.chdir(data_base_dir)
result_file = open ( data_base_dir + 'vexmag_meta_data.txt', 'w')

def convertToJD(date):
	return sum(gcal2jd(date.year, date.month, date.day)) + ( float(date.hour*3600 + date.minute*60 + date.second) / 86400.0 )

# row definition in first line, equal row names in rd...
result_file.write ("granule_uid, granule_gid, obs_id, dataproduct_type, target_name, target_class, time_min, time_max, time_sampling_step_min, time_sampling_step_max, time_exp_min, time_exp_max, spectral_range_min, spectral_range_max, spectral_sampling_step_min, spectral_sampling_step_max, spectral_resolution_min, spectral_resolution_max, c1min, c1max, c2min, c2max, c3min, c3max, s_region, c1_resol_min, c1_resol_max, c2_resol_min, c2_resol_max, c3_resol_min, c3_resol_max, spatial_frame_type, incidence_min, incidence_max, emergence_min, emergence_max, phase_min, phase_max, instrument_host_name, instrument_name, measurement_type,	processing_level, creation_date, modification_date, release_date, service_title, access_url, access_format,	access_estsize, file_name, bib_reference, time_scale, publisher, target_region, target_distance_min, target_distance_max\n")

for file in sorted(glob.glob('*.dat')):
	print ('Processing file "' + file + '"...')
		
	with open(file, "r") as ins:
		source_array = []
		result_line = []
		current_line = []
		target_dist_arr = []
		x_array = []
		y_array = []
		z_array = []
		
		for line in ins:
			source_array.append(line)
		
		for line in source_array: # build up arrays for retrievig min and max values for x,y,z and target ddistance
			current_line = line.split('  ')
			target_dist_arr.append( math.sqrt ( math.pow ( float(current_line[7]), 2 ) + math.pow ( float(current_line[8]), 2 ) + math.pow ( float(current_line[9]), 2 ) ) / 6051.8 )
			
			x_array.append ( float(current_line[7]) )
			y_array.append ( float(current_line[8]) )
			z_array.append ( float(current_line[9]) )

		# granule_iud
		result_line.append(str(granule_uid))
		result_line.append(value_sep)
		granule_uid = granule_uid + 1
		
		# granule_gid
		result_line.append("VEx-MAG")
		result_line.append(value_sep)		

		# obs_id
		result_line.append("VEx-MAG")
		result_line.append(value_sep)		
		
		# dataproduct_type
		result_line.append("ts")
		result_line.append(value_sep)		
		
		# target_name
		result_line.append("Venus")
		result_line.append(value_sep)		
		
		# target_class
		result_line.append("planet")
		result_line.append(value_sep)		

		# time_min, time_max
		result_line.append( str ( convertToJD ( datetime.strptime(source_array[0].split('  ')[0], '%Y-%m-%dT%H:%M:%S.%f') ) ) )
		result_line.append(value_sep)		
		result_line.append( str ( convertToJD ( datetime.strptime(source_array[len(source_array) -1].split('  ')[0], '%Y-%m-%dT%H:%M:%S.%f') ) ) )
		result_line.append(value_sep)		
		
		# time_sampling_step_min and max
		result_line.append("4.0")
		result_line.append(value_sep)
		result_line.append("4.0")
		result_line.append(value_sep)
		
		# time_exp_min and max
		result_line.append(float_null)
		result_line.append(value_sep)
		result_line.append(float_null)
		result_line.append(value_sep)
		
		# spectral_range_min and max
		result_line.append(float_null)
		result_line.append(value_sep)
		result_line.append(float_null)
		result_line.append(value_sep)
		
		# spectral_sampling_step_min and max
		result_line.append(float_null)
		result_line.append(value_sep)
		result_line.append(float_null)
		result_line.append(value_sep)

		# spectral_resolution_min and max
		result_line.append(float_null)
		result_line.append(value_sep)
		result_line.append(float_null)
		result_line.append(value_sep)
		
		#c1min, c1max ... c3min, c3max
		x_array = sorted(x_array)
		y_array = sorted(y_array)
		z_array = sorted(z_array)
		
		result_line.append( str(x_array[0]) ) 
		result_line.append(value_sep)
		result_line.append( str(x_array[len(x_array) - 1]) )
		result_line.append(value_sep)
		result_line.append( str(y_array[0]) )
		result_line.append(value_sep)
		result_line.append( str(y_array[len(y_array) - 1]) )
		result_line.append(value_sep)
		result_line.append( str(z_array[0]) ) 
		result_line.append(value_sep)
		result_line.append( str(z_array[len(z_array) - 1]) )
		result_line.append(value_sep)
		
		# s_region
		result_line.append(value_null)
		result_line.append(value_sep)

		#c1_resol_min, c1_resol_max ... c3_resol_min, c3_resol_max
		result_line.append("1.0") 
		result_line.append(value_sep)
		result_line.append("1.0") 
		result_line.append(value_sep)
		result_line.append("1.0") 
		result_line.append(value_sep)
		result_line.append("1.0") 
		result_line.append(value_sep)
		result_line.append("1.0") 
		result_line.append(value_sep)
		result_line.append("1.0") 
		result_line.append(value_sep)
		
		# spatial_frame_type
		result_line.append("cartesian")
		result_line.append(value_sep)

		# incidence_min and max
		result_line.append(float_null)
		result_line.append(value_sep)
		result_line.append(float_null)
		result_line.append(value_sep)

		# emergence_min and max
		result_line.append(float_null)
		result_line.append(value_sep)
		result_line.append(float_null)
		result_line.append(value_sep)
		
		# phase_min and max
		result_line.append(float_null)
		result_line.append(value_sep)
		result_line.append(float_null)
		result_line.append(value_sep)

		# instrument_host_name 
		result_line.append("Venus-Express")
		result_line.append(value_sep)

		# instrument_name 
		result_line.append("MAG")
		result_line.append(value_sep)
		
		# measurement_type 
		result_line.append("phys.magField")
		result_line.append(value_sep)
		
		# processing_level 
		result_line.append("5")
		result_line.append(value_sep)
		
		# creation_date
		result_line.append(date_null)
		result_line.append(value_sep)

		# modification_date
		result_line.append(today_date)
		result_line.append(value_sep)

		# release_date
		result_line.append(date_null)
		result_line.append(value_sep)

		# service_title
		result_line.append("Venus-Express Magnetometer Data")
		result_line.append(value_sep)

		# access_url
		result_line.append( data_base_url + file.replace(".dat", ".xml"))
		result_line.append(value_sep)

		# access_format
		result_line.append("VOTable")
		result_line.append(value_sep)
		
		# access_estsize
		result_line.append( str(os.path.getsize(data_base_dir + file.replace(".dat", ".xml"))/1024) )
		result_line.append(value_sep)

		# file_name
		result_line.append(file.replace(".dat", ".xml"))
		result_line.append(value_sep)

		# bib_reference
		result_line.append("10.1029/2008JE003215")
		result_line.append(value_sep)

		# time_scale
		result_line.append("UTC")
		result_line.append(value_sep)

		# publisher
		result_line.append("VEx-MAG Graz Data Centre on behalf of PI Tielong Zhang")
		result_line.append(value_sep)

		# target_region
		result_line.append("magnetosphere")
		result_line.append(value_sep)

		# target distance min an max values
		target_dist_arr = sorted(target_dist_arr)
		result_line.append( str(round ( target_dist_arr[0], round_to ) ) ) # min
		result_line.append(value_sep)
		result_line.append( str(round ( target_dist_arr[len(target_dist_arr) - 1], round_to ) ) ) # max
		result_line.append(value_sep)
		
		result_line.append("\n")
		
	result_file.write ( "".join(result_line) )
	print("done.")

