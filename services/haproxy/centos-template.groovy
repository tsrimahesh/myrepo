[
SMALL_CENTOS : computeTemplate {
	imageId "us-west-2/ami-e56327d5"
	machineMemoryMB 1600
	hardwareId = "m1.small"
	locationId = "us-west-2"
	localDirectory "upload"
	remoteDirectory "/root/gs-files"
	username "root"
	keyFile = "fsdemokeypair.pem"
	fileTransfer = "SFTP"
	remoteExecution = "SSH"
	options ([
	"securityGroups" : ["default"]as String[],
	"keyPair" : "pkfsdemokeypair"
	])
	overrides ([
	"jclouds.ec2.ami-query" :"",
	"jclouds.ec2.cc-ami-query":""
	])
	// enable sudo.
	privileged true
	autoRestartAgent true
	
}
]