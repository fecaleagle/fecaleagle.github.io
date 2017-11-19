<!---
	Define the Cache Manifest content. I'm doing it this way since
	the "CACHE MANIFEST" line needs to be the first line in the file
	and storing it in a buffer allows us to TRIM later without having
	ugly line breaks.
--->
<cfsavecontent variable="cacheManifest">

<!---
	NOTE: Cache Manifest must be the very first thing in this
	manifest file.
--->
CACHE MANIFEST

<!---
	When a cache manifest is reviewed by the browser, it uses a
	complete byte-wise comparison. As such, we can use COMMENTS
	to defunk a previously used cache manifest. In this way, we
	can use a version-comment to indicate change even when the
	file list has not changed.

	NOTE: If ANY part of this file is different from the previous
	cache manifest, ALL of the files are re-downloaded.
--->
# Cache Manifest Version: 1.0

<!---
	Let's list the file that get cached. The URLs to these files
	are relative to the cache manifest file (or absolute).
--->
# Core files.

# iPhone App files (for full-screen app mode).

# Images that get viewed.
./serial.png

</cfsavecontent>


<!--- ----------------------------------------------------- --->
<!--- ----------------------------------------------------- --->


<!---
	Let's reset the output and set the appropriate content type.
	It is critical that the manifest file be served up as a type
	"text/cache-manifest" mime-type.

	NOTE: We need to be careful about the whitespace here since
	the very first line of the file must contain the phrase,
	"CACHE MANIFEST". As such, we must TRIM() the content.
--->
<cfcontent
	type="text/cache-manifest"
	variable="#toBinary( toBase64( trim( cacheManifest ) ) )#"
	/>
