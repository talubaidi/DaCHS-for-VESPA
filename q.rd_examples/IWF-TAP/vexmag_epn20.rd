<?xml version="2.0" encoding="utf-8"?>

<resource schema="vexmag_epn20">
	<meta name="title">Venus-Express Magnetometer Data</meta>
	<meta name="creationDate">2014-01-27T12:00:00Z</meta>
	<meta name="description" format="plain">
	      Venus-Express Observations of the Magnetic Field in VSO Coordinates including Spacecraft Positions
	</meta>
	<meta name="copyright">Free to use.</meta>
	<meta name="creator.name">Al-Ubaidi, T.; Scherf, M.; Zhang, T.</meta>
	<meta name="subject">Venus Magnetosphere</meta>

    <table id="epn_core" onDisk="True" adql="True">
        <meta name="info" infoName="SERVICE_PROTOCOL" infoValue="0.35">EPN-TAP</meta>
        <meta name="description">Venus Magnetic Field in VSO Coordinates</meta>
        <meta name="referenceURL">http://onlinelibrary.wiley.com/doi/10.1029/2008JE003215/abstract</meta>
        <meta name="utype">EPN-TAP 2.0</meta>
        <property key="supportsModel">EPN-TAP 2.0</property>
        <property key="supportsModelURI">ivo://vopdc.obspm/std/EpnCore-2.0</property>
        <publish sets="ivo_managed"/>
    	
    	<!-- Mandatory columns -->
        <column name="granule_uid" type="text" required="True" 
          ucd="meta.id" 
          description="Granule unique identifier, provides direct access"/>
    	  
        <column name="granule_gid" type="text" required="True" 
          ucd="meta.id" 
          description="Group identifier, identical for similar data products"/>
    	  
        <column name="obs_id" type="text" required="True" 
          ucd="meta.id" 
          description="Identical for data products related to the same original data"/>
    	  
        <column name="dataproduct_type" type="text" 
          ucd="meta.code.class" 
          description="Organization of the data product (from enumerated list)"/>
    	  
        <column name="target_name" type="text" 
          ucd="meta.id;src" 
          description="Name of target (IAU standard)"/>
    	  
        <column name="target_class" type="text" 
          ucd="meta.code.class;src" 
          description="Type of target, from enumerated list"/>
    	  
        <column name="time_min" type="double precision"
          ucd="time.start" unit="d"
          description="Acquisition start time (in JD)"/>
    	  
        <column name="time_max" type="double precision"
          ucd="time.end" unit="d"
          description="Acquisition stop time (in JD)"/>
    	  
        <column name="time_sampling_step_min" type="double precision"
          ucd="time.interval;stat.min" unit="s"
          description="Min time sampling step"/>
    	  
        <column name="time_sampling_step_max" type="double precision"
          ucd="time.interval;stat.max" unit="s"
          description="Max time sampling step"/>
    	  
        <column name="time_exp_min" type="double precision"
          ucd="time.duration;stat.min" unit="s"
          description="Min integration time">
    		<values nullLiteral="9999.9999"/>
        </column>
    	  
        <column name="time_exp_max" type="double precision"
          ucd="time.duration;stat.max" unit="s"
          description="Max integration time"/>
    	  
        <column name="spectral_range_min" type="double precision"
          ucd="em.freq;stat.min" unit="Hz"
          description="Min spectral range (as frequency)"/>
    	  
        <column name="spectral_range_max" type="double precision"
          ucd="em.freq;stat.max" unit="Hz"
          description="Max spectral range (as frequency)"/>
    	  
        <column name="spectral_sampling_step_min" type="double precision"
          ucd="em.freq.step;stat.min" unit="Hz"
          description="Min spectral sampling step (as frequency)"/>
    	  
        <column name="spectral_sampling_step_max" type="double precision"
          ucd="em.freq.step;stat.max" unit="Hz"
          description="Max spectral sampling step (as frequency)"/>
    	  
        <column name="spectral_resolution_min" type="double precision"
          ucd="spect.resolution;stat.min" unit="Hz"
          description="Min spectral resolution (as frequency)"/>
    	  
        <column name="spectral_resolution_max" type="double precision"
          ucd="spect.resolution;stat.max" unit="Hz"
          description="Max spectral resolution (as frequency)"/>
    	  
        <column name="c1min" type="double precision" 
          ucd="pos;stat.min" unit="Rv"
          description="Min of first coordinate"/>
    	  
        <column name="c1max" type="double precision" 
          ucd="pos;stat.max" unit="Rv"
          description="Max of first coordinate"/>
    	  
        <column name="c2min" type="double precision" 
          ucd="pos;stat.min" unit="Rv"
          description="Min of first coordinate"/>
    	  
        <column name="c2max" type="double precision" 
          ucd="pos;stat.max" unit="Rv"
          description="Max of first coordinate"/>
    	  
        <column name="c3min" type="double precision" 
          ucd="pos;stat.min" unit="Rv"
          description="Min of third coordinate"/>
    	  
        <column name="c3max" type="double precision" 
          ucd="pos;stat.max" unit="Rv"
          description="Max of third coordinate"/>
    	  
        <column name="s_region" type="text" 
          ucd="phys.angArea;obs" 
          description="Provides footprint"/>
    	  
        <column name="c1_resol_min" type="double precision" 
          ucd="pos.resolution;stat.min" unit="m"
          description="Min resolution in first coordinate"/>
    	  
        <column name="c1_resol_max" type="double precision" 
          ucd="pos.resolution;stat.max" unit="m"
          description="Max resolution in first coordinate"/>
    	  
        <column name="c2_resol_min" type="double precision" 
          ucd="pos.resolution;stat.min" unit="m"
          description="Min resolution in second coordinate"/>
    	  
        <column name="c2_resol_max" type="double precision" 
          ucd="pos.resolution;stat.max" unit="m"
          description="Max resolution in second coordinate"/>
          
        <column name="c3_resol_min" type="double precision" 
          ucd="pos.resolution;stat.min" unit="m"
          description="Min resolution in third coordinate"/>
          
        <column name="c3_resol_max" type="double precision" 
          ucd="pos.resolution;stat.max" unit="m"
          description="Max resolution in third coordinate"/>
          
        <column name="spatial_frame_type" type="text" 
          ucd="meta.id;class" 
          description="Flavor of coordinate system, defines the nature of coordinates"/>
        
        <column name="incidence_min" type="double precision"
          ucd="pos.posAng;stat.min" unit="deg"
          description="Min incidence angle (solar zenith angle)"/>
    	  
        <column name="incidence_max" type="double precision"
          ucd="pos.posAng;stat.max" unit="deg"
          description="Max incidence angle (solar zenith angle) "/>
    	  
        <column name="emergence_min" type="double precision"
          ucd="pos.posAng;stat.min" unit="deg"
          description="Min emergence angle"/>
    	  
        <column name="emergence_max" type="double precision"
          ucd="pos.posAng;stat.max" unit="deg"
          description="Max emergence angle"/>
    	  
        <column name="phase_min" type="double precision"
          ucd="pos.phaseAng;stat.min" unit="deg"
          description="Min phase angle"/>
    	  
        <column name="phase_max" type="double precision" 
          ucd="pos.phaseAng;stat.max" unit="deg"
          description="Max phase angle"/>
    	  
        <column name="instrument_host_name" type="text"
          ucd="meta.id;instr.obsty"
          description="Standard name of the observatory or spacecraft"/>
    	  
        <column name="instrument_name" type="text"
          ucd="meta.id;instr"
          description="Standard name of the instrument"/>
    	  
        <column name="measurement_type" type="text"
          ucd="meta.ucd"
          description="UCD(s) defining the nature of measurements"/>
    
        <column name="processing_level"  type="integer" required="True"
          ucd="meta.code;obs.calib"
          description="Level of calibration (CODMAC level)"/>
    
        <column name="creation_date" type="date"
          ucd="time.creation"
          description="Creation date of entry"/>
    	  
        <column name="modification_date" type="date"
          ucd="time.update"
          description="Date of last modification of entry"/>
    	  
        <column name="release_date" type="date"
          ucd="time.release"
          description="Start of public period"/>
    
        <column name="service_title" type="text"
          ucd="meta.title"
          description="Acronym of this data service"/>	  
    	  
        
        <!-- Non-mandatory columns according to EPN 2.0 -->
    	
        <column name="access_url" type="text"
          ucd="meta.ref.url"
          description="URL of the data file"/>
    	  
        <column name="access_format" type="text"
          ucd="meta.code;mime"
          description="File format type"/>
    	  
        <column name="access_estsize" type="integer" unit="kbyte" required="True"
          ucd="phys.size;meta.file"
          description="Estimate file size in kB"/>
    	  
        <column name="file_name" type="text"
          ucd="meta.id;meta.file"
          description="Name root of the data file"/>
    	  
        <column name="bib_reference" type="text"
          ucd="meta.bib"
          description="Extra: bibliograpic reference"/>
    	  
        <column name="time_scale" type="text"
          ucd="time.scale" 
          description="Time scale, constant for data services = UTC"/>	   
    
        <column name="publisher" type="text"
          ucd="meta.name"
          description="Publisher of the ressource"/>
        
        <column name="target_region" type="text"
          ucd="meta.id;class"
          description="Tye of region of interest"/>
        
        
        <!-- Custom colums according to VEx_MAG data -->
        
        <column name="target_distance_min" type="double precision"
          ucd="pos.distance;stat.min" unit="Rv"
          description="Spacecraft-target min distance"/>
    	  
        <column name="target_distance_max" type="double precision"
          ucd="pos.distance;stat.max" unit="Rv"
          description="Spacecraft-target max distance"/>
    
    </table>

    <data id="vexmag_epn20">
    	<sources pattern="data/vexmag_meta_data.txt"/>
    	<reGrammar topIgnoredLines="1">
    		<fieldSep>\s\s</fieldSep>
    		<names>
    			granule_uid, granule_gid, obs_id, dataproduct_type, target_name, target_class, time_min, time_max,
    			time_sampling_step_min, time_sampling_step_max, time_exp_min, time_exp_max, spectral_range_min,
    			spectral_range_max, spectral_sampling_step_min, spectral_sampling_step_max, spectral_resolution_min, 
    			spectral_resolution_max, c1min, c1max, c2min, c2max, c3min, c3max, s_region, c1_resol_min, c1_resol_max, 
    			c2_resol_min, c2_resol_max, c3_resol_min, c3_resol_max, spatial_frame_type, incidence_min, incidence_max,
    			emergence_min, emergence_max, phase_min, phase_max, instrument_host_name, instrument_name, measurement_type,
    			processing_level, creation_date, modification_date, release_date, service_title, access_url, access_format,
    			access_estsize, file_name, bib_reference, time_scale, publisher, target_region, target_distance_min, target_distance_max
    		</names>
    	</reGrammar>
    
    	<make table="epn_core">
    		<rowmaker id="build_vexmag_epn20" idmaps="*">
    			<map dest="time_exp_min">parseWithNull(@time_exp_min, float, "9999.9999")</map>
    		 	<map dest="time_exp_max">parseWithNull(@time_exp_max, float, "9999.9999")</map>
    		 	<map dest="spectral_range_min">parseWithNull(@spectral_range_min, float, "9999.9999")</map>
    		 	<map dest="spectral_range_max">parseWithNull(@spectral_range_max, float, "9999.9999")</map>
    		 	<map dest="spectral_sampling_step_min">parseWithNull(@spectral_sampling_step_min, float, "9999.9999")</map>
    		 	<map dest="spectral_sampling_step_max">parseWithNull(@spectral_sampling_step_max, float, "9999.9999")</map>
    		 	<map dest="spectral_resolution_min">parseWithNull(@spectral_resolution_min, float, "9999.9999")</map>
    		 	<map dest="spectral_resolution_max">parseWithNull(@spectral_resolution_max, float, "9999.9999")</map>
    		 	<map dest="incidence_min">parseWithNull(@incidence_min, float, "9999.9999")</map>
    		 	<map dest="incidence_max">parseWithNull(@incidence_max, float, "9999.9999")</map>
    		 	<map dest="emergence_min">parseWithNull(@emergence_min, float, "9999.9999")</map>
    		 	<map dest="emergence_max">parseWithNull(@emergence_min, float, "9999.9999")</map>
    		 	<map dest="phase_min">parseWithNull(@phase_min, float, "9999.9999")</map>
    		 	<map dest="phase_max">parseWithNull(@phase_max, float, "9999.9999")</map>
    
    		 	<map dest="s_region">parseWithNull(@s_region, str, "NULL")</map>
    			
    		 	<map dest="creation_date">parseWithNull(@creation_date, datetime, "1900-01-01")</map>
    		 	<map dest="release_date">parseWithNull(@release_date, datetime, "1900-01-01")</map>
    			
    		</rowmaker>    		
    	</make>
    </data>
    
    <data id="collection" auto="false">
    	<register services="__system__/tap#run"/>
    	<make table="epn_core"/>
    </data>

</resource>
