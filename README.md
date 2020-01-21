### Hoa Library (A high order ambisonics library) for <a title="Faust " href="http://faust.grame.fr/" target="_blank">Faust </a>

##### Version :

Hoa.lib 1.3 for Faust (<a title="Download" href="http://www.mshparisnord.fr/hoalibrary/en/downloads/" target="_blank">Download</a>). The hoa.lib file contains the high order ambisonics functions in FAUST. This version  isn't included in the Faust distribution (for now).
Home of the project : <a title="https://framagit.org/wargreen/hoalibrary-faust" href="https://framagit.org/wargreen/hoalibrary-faust" target="_blank">https://framagit.org/wargreen/hoalibrary-faust</a>

![Image Faust](https://raw.github.com/CICM/HoaLibrary/master/Ressources/PhotoFaust.png "Faust Scene")

##### Authors :

Julien Colafrancesco, Pierre Guillot, Eliott Paris, Wargreen

##### Licence : 

The hoa.library in under the <a title="GNU" href="http://www.gnu.org/copyleft/gpl.html" target="_blank">GNU Public License</a>. If you'd like to avoid the restrictions of the GPL and use Hoa Library for a closed-source product, you contact the <a title="CICM" href="http://cicm.mshparisnord.org/" target="_blank">CICM</a>.

##### Functions :

- encoder : encodes a signal in the circular harmonics domain depending on an order of decomposition and an angle.

- decoder : decodes an ambisonics sound field for a circular array of loudspeakers. 

- decoderStereo : decodes an ambisonic sound field for stereophonic configuration. 

- optimBasic, optimMaxRe, optimInPhase : weights the circular harmonics signals depending to the ambisonics optimization. It can be "basic" for no optimization, "maxRe" or "inPhase".

- wider : can be used to wide the diffusion of a localised sound. The order depending signals are weighted and appear in a logarithmic way to have linear changes.

- map : encodes a source with distance compensation.

- rotate : applies a rotation of the sound field.

- encoder3D : encodes a signal in the 3D circular harmonics domain depending on an order of decomposition and two angle.

- optimBasic3D, optimMaxRe3D, optimInPhase3D : weights the 3D circular harmonics signals depending to the ambisonics optimization. It can be "basic" for no optimization, "maxRe" or "inPhase".
