if ( $('.galleria').length ) {
	// or for asset path
	Galleria.loadAssetTheme('classic');
	console.log('before');
	// Then configure
	Galleria.configure({
	    imageCrop: true,
	    transition: 'fade',
	    log: true,
	    // better handle image paths in assets folder!
	    // assets: true,
	    // if pic can't be loaded use this one as fallback
	    dummy: '/assets/photos/dummy.png' 
	});  
	
	Galleria.run('.galleria');
}
