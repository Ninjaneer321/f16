# A database of flying, surface and marine entities. Inspired from pinto's MiG-21bis mp_db.nas

var BaseEntry = {
	isReal: 1, # Radar and RWR will ignore this if false
	isSlow: 0, # Slow aircraft, so heli or drone (can cruise slower than 50 to 60 kt)
	canFly: 1,
	isShip: 0,
	isSurfaceAsset: 0,
	isAwacs: 0,
	isCarrier: 0,
	rcsFrontal: 150,
	hasAirRadar: 0, # If it only has A/G radar or none then set this to 0
	passiveRadarRange: 70,# Distance in nm that antiradiation weapons can home in on the the radiation.		
	radarFieldRadius: 60, 
	rwrCode: "U",          # Used by RWR and anti-radiation weapon systems (Radar Emitter Code)
	baseThreat: func (my_deviation_from_him_deg) {return 0;},
	baseDangerNM: 50,
};

var defaultFighterThreat = func (my_deviation_from_him_deg) {return ((180-my_deviation_from_him_deg)/180)*0.30;};
var defaultMissileShipThreat = func (my_deviation_from_him_deg) {return 0.30;};
var defaultSurfaceThreat = func (my_deviation_from_him_deg) {return 0.30;};

var Database = {
	"default": BaseEntry,
# Small aircraft (emesary enabled)
    "A-10":                   {baseDangerNM: 15, baseThreat:defaultFighterThreat},
    "A-10-model":             {baseDangerNM: 15, baseThreat:defaultFighterThreat},
    "A-10-modelB":            {baseDangerNM: 15, baseThreat:defaultFighterThreat},
    "AJ37-Viggen":            {hasAirRadar:1, rwrCode:"37", baseDangerNM: 15, baseThreat:defaultFighterThreat},
    "AJS37-Viggen":           {hasAirRadar:1, rwrCode:"37", baseDangerNM: 15, baseThreat:defaultFighterThreat},
    "Blackbird-SR71A":        {},
    "Blackbird-SR71A-BigTail":{},
    "Blackbird-SR71B":        {},
	"f-14b":                  {hasAirRadar:1, rwrCode:"14", baseDangerNM: 80, baseThreat:defaultFighterThreat},
    "f-14b-bs":               {isReal: 0},
    "F-14D":                  {hasAirRadar:1, rwrCode:"14", baseDangerNM: 80, baseThreat:defaultFighterThreat},
    "F-15C":                  {hasAirRadar:1, rwrCode:"15", baseThreat:defaultFighterThreat},
    "F-15D":                  {hasAirRadar:1, rwrCode:"15", baseThreat:defaultFighterThreat},
    "F-16":                   {hasAirRadar:1, rwrCode:"16", baseThreat:defaultFighterThreat},
    "f15-bs":                 {isReal: 0},
    "JA37-Viggen":            {hasAirRadar:1, rwrCode:"37", baseThreat:defaultFighterThreat},
    "JA37Di-Viggen":          {hasAirRadar:1, rwrCode:"37", baseThreat:defaultFighterThreat},
    "Jaguar-GR1":             {baseDangerNM: 15, baseThreat:defaultFighterThreat},
    "Jaguar-GR3":             {baseDangerNM: 15, baseThreat:defaultFighterThreat},
    "m2000-5":                {hasAirRadar:1, rwrCode:"M2", baseThreat:defaultFighterThreat},
    "m2000-5B":               {hasAirRadar:1, rwrCode:"M2", baseThreat:defaultFighterThreat},
    "m2000-5B-backseat":      {isReal: 0},
    "MiG-21bis":              {hasAirRadar:1, rwrCode:"21", baseThreat:defaultFighterThreat},
    "MiG-21MF-75":            {hasAirRadar:1, rwrCode:"21", baseThreat:defaultFighterThreat},
    "Typhoon":                {hasAirRadar:1, rwrCode:"EF", baseThreat:defaultFighterThreat},
    "MiG-23ML":               {hasAirRadar:1, rwrCode:"23", baseThreat:defaultFighterThreat},
    "MiG-23MLD":              {hasAirRadar:1, rwrCode:"23", baseThreat:defaultFighterThreat},
# Big aircraft
    "B-1B":                   {hasAirRadar:1, rwrCode:"B1"},
    "C-137R":                 {},
    "c130":                   {},
    "E-3R":                   {hasAirRadar:1, rwrCode:"S", isAwacs: 1, radarFieldRadius: 180},
    "E-8R":                   {},
    "EC-137D":                {hasAirRadar:1, rwrCode:"S", isAwacs: 1, radarFieldRadius: 180},
    "EC-137R":                {hasAirRadar:1, rwrCode:"S", isAwacs: 1, radarFieldRadius: 180},
    "KC-10A":                 {},
    "KC-10A-GE":              {},
    "KC-137R":                {},
    "KC-137R-RT":             {},
    "KC-30A":                 {},
    "RC-137R":                {},
    "Voyager-KC":             {},
# OPRF assets (emesary enabled)
    "depot":                  {isSurfaceAsset: 1, canFly: 0},
    "ZSU-23-4M":              {isSurfaceAsset: 1, canFly: 0, hasAirRadar:1, rwrCode:"AA", baseDangerNM: 7.5, radarFieldRadius: 180, baseThreat:defaultSurfaceThreat},
    "SA-6":                   {isSurfaceAsset: 1, canFly: 0, hasAirRadar:1, rwrCode:"6", baseDangerNM: 15, radarFieldRadius: 180, baseThreat:defaultSurfaceThreat},
    "buk-m2":                 {isSurfaceAsset: 1, canFly: 0, hasAirRadar:1, rwrCode:"17", baseDangerNM: 35, radarFieldRadius: 180, baseThreat:defaultSurfaceThreat},
    "buk-m1-2":               {isSurfaceAsset: 1, canFly: 0, hasAirRadar:1, rwrCode:"17", baseDangerNM: 35, radarFieldRadius: 180, baseThreat:defaultSurfaceThreat},
    "S-75":                   {isSurfaceAsset: 1, canFly: 0, hasAirRadar:1, rwrCode:"2", baseDangerNM: 35, radarFieldRadius: 180, baseThreat:defaultSurfaceThreat},
    "s-200":                  {isSurfaceAsset: 1, canFly: 0, hasAirRadar:1, rwrCode:"5", baseDangerNM: 150, radarFieldRadius: 180, baseThreat:defaultSurfaceThreat},
    "s-300":                  {isSurfaceAsset: 1, canFly: 0, hasAirRadar:1, rwrCode:"20", baseDangerNM: 80, radarFieldRadius: 180, baseThreat:defaultSurfaceThreat},
    "MIM104D":                {isSurfaceAsset: 1, canFly: 0, hasAirRadar:1, rwrCode:"P", baseDangerNM: 45, radarFieldRadius: 180, baseThreat:defaultSurfaceThreat},
    "truck":                  {isSurfaceAsset: 1, canFly: 0},
    "missile_frigate":        {isShip: 1, canFly: 0, hasAirRadar:1, rwrCode:"SH", baseDangerNM: 80, radarFieldRadius: 180, baseThreat:defaultMissileShipThreat},
    "fleet":                  {isShip: 1, canFly: 0, hasAirRadar:1, rwrCode:"SH", baseDangerNM: 80, radarFieldRadius: 180, baseThreat:defaultMissileShipThreat},
    "frigate":                {isShip: 1, canFly: 0, hasAirRadar:1, rwrCode:"SH", baseDangerNM: 80, radarFieldRadius: 180, baseThreat:defaultMissileShipThreat},
    "tower":                  {isSurfaceAsset: 1, canFly: 0, hasAirRadar:1, radarFieldRadius: 180},
    "gci":                    {isSurfaceAsset: 1, canFly: 0, hasAirRadar:1, radarFieldRadius: 180},
    "struct":                 {isSurfaceAsset: 1, canFly: 0},
    "rig":                    {isSurfaceAsset: 1, canFly: 0},
    "point":                  {isSurfaceAsset: 1, canFly: 0},
    "hunter":                 {isReal: 0},
# Automats (emesary enabled)
    "MiG-29":                 {hasAirRadar:1, rwrCode:"29", baseThreat:defaultFighterThreat},
    "SU-27":                  {hasAirRadar:1, rwrCode:"27", baseThreat:defaultFighterThreat},
    "daVinci_SU-34":          {hasAirRadar:1, rwrCode:"34", baseThreat:defaultFighterThreat},
    "A-50":                   {hasAirRadar:1, rwrCode:"S", radarFieldRadius: 180, isAwacs: 1},
    "E-3":                    {hasAirRadar:1, rwrCode:"S", radarFieldRadius: 180, isAwacs: 1},
# Hunter ships (emesary enabled)
    "USS-NORMANDY":           {hasAirRadar:1, canFly: 0, isShip: 1, radarFieldRadius: 180, rwrCode:"SH", baseDangerNM: 80, baseThreat:defaultMissileShipThreat},
    "USS-LakeChamplain":      {hasAirRadar:1, canFly: 0, isShip: 1, radarFieldRadius: 180, rwrCode:"SH", baseDangerNM: 80, baseThreat:defaultMissileShipThreat},
    "USS-OliverPerry":        {hasAirRadar:1, canFly: 0, isShip: 1, radarFieldRadius: 180, rwrCode:"SH", baseDangerNM: 80, baseThreat:defaultMissileShipThreat},
    "USS-SanAntonio":         {hasAirRadar:1, canFly: 0, isShip: 1, radarFieldRadius: 180, rwrCode:"SH", baseDangerNM: 80, baseThreat:defaultMissileShipThreat},
# Carriers
	"mp-clemenceau":          {hasAirRadar:1, canFly: 0, isShip: 1, isCarrier: 1, radarFieldRadius: 180, baseThreat:defaultMissileShipThreat},
	"mp-eisenhower":          {hasAirRadar:1, canFly: 0, isShip: 1, isCarrier: 1, radarFieldRadius: 180, baseThreat:defaultMissileShipThreat},
	"mp-nimitz":              {hasAirRadar:1, canFly: 0, isShip: 1, isCarrier: 1, radarFieldRadius: 180, baseThreat:defaultMissileShipThreat},
	"mp-vinson":              {hasAirRadar:1, canFly: 0, isShip: 1, isCarrier: 1, radarFieldRadius: 180, baseThreat:defaultMissileShipThreat},
# Drones
    "QF-4E":                  {},
    "MQ-9":                   {isSlow: 1},
    "MQ-9-2":                 {isSlow: 1},
# Helis 
    "212-TwinHuey":           {isSlow: 1},
    "212-TwinHuey":           {isSlow: 1},
    "412-Griffin":            {isSlow: 1},
    "412-Griffin":            {isSlow: 1},
    "AH-1W":                  {isSlow: 1},
    "AS532-Cougar":           {isSlow: 1},
    "CH47":                   {isSlow: 1},
    "CH47":                   {isSlow: 1},
    "ch53e":                  {isSlow: 1},
    "ch53e":                  {isSlow: 1},
    "Gazelle":                {isSlow: 1},
    "Lynx-HMA8":              {isSlow: 1},
    "Lynx_Wildcat":           {isSlow: 1},
    "Merlin-HM1":             {isSlow: 1},
    "mi24":                   {isSlow: 1},
    "mi24":                   {isSlow: 1},
    "Mil-Mi-8":               {isSlow: 1},
    "Mil-Mi-8":               {isSlow: 1},
    "OH-58D":                 {isSlow: 1},
    "rah-66":                 {isSlow: 1},
    "SH-60J":                 {isSlow: 1},
    "SH-60J":                 {isSlow: 1},
    "tigre":                  {isSlow: 1},
    "tigre":                  {isSlow: 1},
    "UH-60J":                 {isSlow: 1},
    "UH-60J":                 {isSlow: 1},
    "uh1":                    {isSlow: 1},
    "uh1":                    {isSlow: 1},
    "uh60_Blackhawk":         {isSlow: 1},
    "WAH-64_Apache":          {isSlow: 1},
    "Westland_Gazelle":       {isSlow: 1},
    "Westland_SeaKing-HAR3":  {isSlow: 1},
# Various non-emesary
	"AI":                     {},
	"SU-37":                  {hasAirRadar:1, rwrCode:"34", baseThreat:defaultFighterThreat},
	"J-11A":                  {hasAirRadar:1, rwrCode:"27", baseThreat:defaultFighterThreat},
	"Su-34":                  {hasAirRadar:1, rwrCode:"34", baseThreat:defaultFighterThreat},
	"T-50":                   {hasAirRadar:1, rwrCode:"57", baseThreat:defaultFighterThreat},
	"MiG-21Bison":            {hasAirRadar:1, rwrCode:"21", baseThreat:defaultFighterThreat},
	"Mig-29":                 {hasAirRadar:1, rwrCode:"29", baseThreat:defaultFighterThreat},
	"EF2000":                 {hasAirRadar:1, rwrCode:"EF", baseThreat:defaultFighterThreat},
	"F-15C_Eagle":            {hasAirRadar:1, rwrCode:"15", baseThreat:defaultFighterThreat},
	"F-15J_ADTW":             {hasAirRadar:1, rwrCode:"15", baseThreat:defaultFighterThreat},
	"F-15DJ_ADTW":            {hasAirRadar:1, rwrCode:"15", baseThreat:defaultFighterThreat},
	"f16":                    {hasAirRadar:1, rwrCode:"16", baseThreat:defaultFighterThreat},
	"F-16CJ":                 {hasAirRadar:1, rwrCode:"16", baseThreat:defaultFighterThreat},
	"FA-18C_Hornet":          {hasAirRadar:1, rwrCode:"18", baseThreat:defaultFighterThreat},
	"FA-18D_Hornet":          {hasAirRadar:1, rwrCode:"18", baseThreat:defaultFighterThreat},
	"FA-18E_CVW5":            {hasAirRadar:1, rwrCode:"18", baseThreat:defaultFighterThreat},
	"FA-18":                  {hasAirRadar:1, rwrCode:"18", baseThreat:defaultFighterThreat},
	"f18":                    {hasAirRadar:1, rwrCode:"18", baseThreat:defaultFighterThreat},
	"F-111C":                 {hasAirRadar:1, rwrCode:"F1", baseThreat:defaultFighterThreat},
	"daVinci_F-111G":         {hasAirRadar:1, rwrCode:"F1", baseThreat:defaultFighterThreat},
	"A-10-modelB":            {},
	"Su-15":                  {hasAirRadar:1, rwrCode:"SU", baseThreat:defaultFighterThreat},
	"jaguar":                 {hasAirRadar:1, rwrCode:"JA", baseThreat:defaultFighterThreat},
	"Jaguar-GR3":             {hasAirRadar:1, rwrCode:"JA", baseThreat:defaultFighterThreat},
	"E3B":                    {hasAirRadar:1, rwrCode:"S", radarFieldRadius: 180, isAwacs: 1},
	"E-2C-Hawkeye":           {hasAirRadar:1, rwrCode:"S", radarFieldRadius: 180, isAwacs: 1},
	"onox-awacs":             {hasAirRadar:1, rwrCode:"S", radarFieldRadius: 180, isAwacs: 1},
	"u-2s":                   {},
	"U-2S-model":             {},
	"F-4C":                   {hasAirRadar:1, rwrCode:"F4", baseThreat:defaultFighterThreat},
	"F-4D":                   {hasAirRadar:1, rwrCode:"F4", baseThreat:defaultFighterThreat},
	"F-4E":                   {hasAirRadar:1, rwrCode:"F4", baseThreat:defaultFighterThreat},
	"F-4EJ":                  {hasAirRadar:1, rwrCode:"F4", baseThreat:defaultFighterThreat},
	"F-4EJ_ADTW":             {hasAirRadar:1, rwrCode:"F4", baseThreat:defaultFighterThreat},
	"F-4F":                   {hasAirRadar:1, rwrCode:"F4", baseThreat:defaultFighterThreat},
	"F-4J":                   {hasAirRadar:1, rwrCode:"F4", baseThreat:defaultFighterThreat},
	"F4J":                    {hasAirRadar:1, rwrCode:"F4", baseThreat:defaultFighterThreat},
	"F-4N":                   {hasAirRadar:1, rwrCode:"F4", baseThreat:defaultFighterThreat},
	"F-4S":                   {hasAirRadar:1, rwrCode:"F4", baseThreat:defaultFighterThreat},
	"FGR2":                   {hasAirRadar:1, rwrCode:"F4", baseThreat:defaultFighterThreat},
	"FGR2-Phantom":           {hasAirRadar:1, rwrCode:"F4", baseThreat:defaultFighterThreat},
	"a4f":                    {hasAirRadar:1, rwrCode:"A4", baseThreat:defaultFighterThreat},
	"A-4K":                   {hasAirRadar:1, rwrCode:"A4", baseThreat:defaultFighterThreat},
	"F-5E":                   {hasAirRadar:1, rwrCode:"F5", baseThreat:defaultFighterThreat},
	"F-5E-TigerII":           {hasAirRadar:1, rwrCode:"F5", baseThreat:defaultFighterThreat},
	"F-5ENinja":              {hasAirRadar:1, rwrCode:"F5", baseThreat:defaultFighterThreat},
	"f-20A":                  {hasAirRadar:1, rwrCode:"TS", baseThreat:defaultFighterThreat},
	"f-20C":                  {hasAirRadar:1, rwrCode:"TS", baseThreat:defaultFighterThreat},
	"f-20prototype":          {hasAirRadar:1, rwrCode:"TS", baseThreat:defaultFighterThreat},
	"f-20bmw":                {hasAirRadar:1, rwrCode:"TS", baseThreat:defaultFighterThreat},
	"f-20-dutchdemo":         {hasAirRadar:1, rwrCode:"TS", baseThreat:defaultFighterThreat},
	"Tornado-GR4a":           {hasAirRadar:1, rwrCode:"TO", baseThreat:defaultFighterThreat},
	"Tornado-IDS":            {hasAirRadar:1, rwrCode:"TO", baseThreat:defaultFighterThreat},
	"Tornado-F3":             {hasAirRadar:1, rwrCode:"TO", baseThreat:defaultFighterThreat},
	"Tornado-ADV":            {hasAirRadar:1, rwrCode:"TO", baseThreat:defaultFighterThreat},
	"brsq":                   {hasAirRadar:1, rwrCode:"RF", baseThreat:defaultFighterThreat},
	"Harrier-GR1":            {hasAirRadar:1, rwrCode:"HA", baseThreat:defaultFighterThreat},
	"Harrier-GR3":            {hasAirRadar:1, rwrCode:"HA", baseThreat:defaultFighterThreat},
	"Harrier-GR5":            {hasAirRadar:1, rwrCode:"HA", baseThreat:defaultFighterThreat},
	"Harrier-GR9":            {hasAirRadar:1, rwrCode:"HA", baseThreat:defaultFighterThreat},
	"AV-8B":                  {hasAirRadar:1, rwrCode:"AV", baseThreat:defaultFighterThreat},
	"G91-R1B":                {hasAirRadar:1, rwrCode:"91", baseThreat:defaultFighterThreat},
	"G91":                    {hasAirRadar:1, rwrCode:"91", baseThreat:defaultFighterThreat},
	"g91":                    {hasAirRadar:1, rwrCode:"91", baseThreat:defaultFighterThreat},
	"mb339":                  {hasAirRadar:1, rwrCode:"M3", baseThreat:defaultFighterThreat},
	"mb339pan":               {hasAirRadar:1, rwrCode:"M3", baseThreat:defaultFighterThreat},
	"alphajet":               {hasAirRadar:1, rwrCode:"AJ", baseThreat:defaultFighterThreat},
	"MiG-15bis":              {hasAirRadar:1, rwrCode:"15", baseThreat:defaultFighterThreat},
	"Su-25":                  {hasAirRadar:1, rwrCode:"25", baseThreat:defaultFighterThreat},
	"MiG-25":                 {hasAirRadar:1, rwrCode:"25", baseThreat:defaultFighterThreat},
	"A-6E-model":             {hasAirRadar:1, rwrCode:"A6", baseThreat:defaultFighterThreat},
	"A-6E":                   {hasAirRadar:1, rwrCode:"A6", baseThreat:defaultFighterThreat},
	"ea-6b":                  {hasAirRadar:1, rwrCode:"A6", baseThreat:defaultFighterThreat},
	"F-117":                  {},
	"F-22-Raptor":            {hasAirRadar:1, rwrCode:"22", baseThreat:defaultFighterThreat},
	"F-35A":                  {hasAirRadar:1, rwrCode:"35", baseThreat:defaultFighterThreat},
	"F-35B":                  {hasAirRadar:1, rwrCode:"35", baseThreat:defaultFighterThreat},
	"F-35C":                  {hasAirRadar:1, rwrCode:"35", baseThreat:defaultFighterThreat},
	"daVinci_F-35A":          {hasAirRadar:1, rwrCode:"35", baseThreat:defaultFighterThreat},
	"daVinci_F-35B":          {hasAirRadar:1, rwrCode:"35", baseThreat:defaultFighterThreat},
	"JAS-39C_Gripen":         {hasAirRadar:1, rwrCode:"39", baseThreat:defaultFighterThreat},
	"gripen":                 {hasAirRadar:1, rwrCode:"39", baseThreat:defaultFighterThreat},
	"Yak-130":                {hasAirRadar:1, rwrCode:"Y1", baseThreat:defaultFighterThreat},
	"L-159":                  {hasAirRadar:1, rwrCode:"LC", baseThreat:defaultFighterThreat},
	"super-etendard":         {hasAirRadar:1, rwrCode:"ET", baseThreat:defaultFighterThreat},
	"Mirage_F1-model":        {hasAirRadar:1, rwrCode:"M1", baseThreat:defaultFighterThreat},
	"ufo":                    {},
	"bluebird-osg":           {},
	"Vostok-1":               {},
	"V-1":                    {},
	"SpaceShuttle":           {},
	"F-23C_BlackWidow-II":    {},
};

if (defined(rcs.rcs_database)) {
	foreach(entry : keys(rcs.rcs_database)) {
		Database[entry].rcsFrontal = rcs_database[entry];
	}
}

foreach(entry : keys(rcs.rcs_oprf_database)) {
	Database[entry].rcsFrontal = rcs.rcs_oprf_database[entry];
}

foreach (entry : keys(Database)) {
	Database[entry]["parents"] = [BaseEntry];
}