import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Cards/cards.dart';
import '../svgs/svgs.dart' as svgs;
import '../blockly.dart';
import '../PlaySelector/play_select.dart';

class ModeSelector extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ModeSelector();
  }
}

class _ModeSelector extends State<ModeSelector> {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
        theme: ThemeData(
          primaryColor: const Color(0xff0B0533),
          fontFamily: "Baloo 2",
          scaffoldBackgroundColor: const Color(0xff0B0533),
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text("select_device_page").tr(),
              backgroundColor: Colors.transparent,
              centerTitle: true,
            ),
            body: Stack(children: [
              SvgPicture.string(
                '''<svg xmlns="http://www.w3.org/2000/svg" width="2400" height="421.913" viewBox="0 0 2400 421.913">
  <path id="Path_1015" data-name="Path 1015" d="M.736,1570.9l-.736.078v15.374a2.542,2.542,0,0,0,.155-.5H.194A42.225,42.225,0,0,0,.736,1570.9Zm2391.616.581-77.916,6.2c2.788-.93,5.731-2.053,8.674-3.37,12.7-5.733,15.684-21.842,15.684-21.842l-104.484-60.18-79.737-45.89-103.554,113.352c7.086,23,20.99,25.21,22.965,25.4l-.193.038-1.317,24.669-8.482,6.312h-16.38V1609.7h-61.962v-.078h61.923v-6.467h.039V1589.6h2.827V1578.99h-2.827v-2.905h1.278V1570.9h-1.278v-38.726H2072.2l.426.155.5-1.356-59.406-24.2v-1.2h-2.4v1.279l-56,23.778-22.576,12.547.464.813-.116.077-1.395-2.595H1912.5l-1.277-.465,1.78-.619s.814-.968.271-1.007c1.046-.232,3.448-.736,3.448-.736l-1.666-2.71-3.292,1.781s-1.161.891-2.672,1.86c-1.549.928-.349-1.279-.349-1.279l-1.549-2.4a8.676,8.676,0,0,0-2.013-.89c-.581-.04-.736.193-.736.193l-2.981.736a8.132,8.132,0,0,1,1.317,2.052c.194.736-.774,0-1.937.466-1.123.5.309.928.309,1.7a3.5,3.5,0,0,0,.427,1.317h-21.3v-15.8c.387-.619,5.073-8.133,6.7-10.767,1.161-1.9,4.763-7.628,4.763-7.628a51.428,51.428,0,0,1-20.021-2.363l-32.3-12h-.349v-2.829c4.222.7,6.661-13.088,6.661-13.088h-.657l.5-.117-16.033-6h-.349V1468h3.292V1459.6h-6.545v-4.568h1.626v-18.473h2.091v-8.829l-6.545-3.447h-.154v-18.706h-2.75l-2.169-3.446h-.271v-4.416h-.7v-2.129h-1.356v-6.7h-.425v6.7h-1.317v2.129h-.7v4.416h-.271l-2.169,3.446h-2.788v18.706h-.117l-6.583,3.447v8.829h2.091v18.473h1.626v4.568h-6.506V1468h3.292v2.864h-.078l-16.033,6s2.131,13.9,6.235,13.593v2.44h-.348l-30.981,11.54a50.52,50.52,0,0,1-21.416,2.828l11.5,18.51v15.685h-31.214l-1.317-.465,1.82-.619s.813-.968.271-1.007c1.046-.232,3.446-.736,3.446-.736l-1.665-2.71-3.292,1.781s-1.162.891-2.711,1.86c-1.511.928-.31-1.279-.31-1.279l-1.588-2.4a8.186,8.186,0,0,0-1.974-.89c-.62-.04-.736.193-.736.193l-2.983.736a8.093,8.093,0,0,1,1.317,2.052c.155.736-.813,0-1.936.466-1.123.5.309.928.309,1.7a3.5,3.5,0,0,0,.427,1.317h-9.063l-.89,1.626-22.539-12.507-56.192-23.855v-1.164h-2.4v1.318l-59.135,23.933.541,1.355,7.127-2.9-7.01,2.9h24.591V1570.9h-1.239v5.189h1.239v2.905h-3.8l-.078-26.76h.31V1548.7H1534.6c-2.014-25.829-10.03-129.733-10.262-132.752,3.486-7.164-.89-7.9-.89-7.9s-1.859-23.777-2.246-27.844a12.9,12.9,0,0,0,6.738-12.818l-.619-5.112a10.849,10.849,0,0,0-.194-6.623,12.373,12.373,0,0,0-1.279-2.71,21.992,21.992,0,0,0-7.978-7.475c-.425-.233-.814-.5-1.239-.7-.581-.311-1.161-.621-1.782-.892a46.323,46.323,0,0,0-8.48-2.942c-.039-.5-.078-.931-.116-1.2a6.347,6.347,0,0,0,3.33-6.352l-.349-2.864s-3.059-5.848-16.807-5.848-17.272,7.086-17.272,7.086a20.5,20.5,0,0,0-.349,3.99c0,2.362,3.641,4.646,3.641,4.646a4.381,4.381,0,0,0-.039.659,39.36,39.36,0,0,0-10.3,3.563c-.039,0-.078.04-.117.078-5.422,2.865-9.255,6.66-10.65,10.958a11.073,11.073,0,0,0-.658,3.718,11.463,11.463,0,0,0,.658,3.757v7.319a.578.578,0,0,0,.427.541v1.124c0,4.455,6.312,8.753,7.2,9.3.04.078.078.078.078.078a2.017,2.017,0,0,1-.038.349v.037c-.116,2.943-1.007,22.927-1.007,27.264-3.756,6.158,0,8.249,0,8.249l-4.724,138.523h-2.363v3.486h-2.091v.852h-6.7v4.8h.038v.039H1338.108l-15.685,21.609h3.215v11.541h2.634l-1.046,17.929h-12.7c-4.26-13.9-10.8-33.421-19.595-54.526h19.557l12.7-3.6h1.781v-12.431h-10.8v-31.679l10.8-6.854v-7.2h-4.259v-5.19h-64.557q-5-7.493-10.34-14.405c-46.588-59.756-77.3-63.2-89.573-63.2-12.315,0-42.986,3.445-89.574,63.2q-5.4,6.913-10.34,14.405H993.482v5.19h-4.26v7.2l10.767,6.854v31.679H989.222v12.431H991l12.664,3.6h21.841c-8.093,19.517-14.29,37.681-18.55,51.313-15.141-4.88-59.87-30.517-75.322-163.967l-19.983,2.943,1.123,18.472s-.078,9.1-6.351,9.565a9.986,9.986,0,0,1-8.442-3.6l-1.123-20.138-3.021-1.666-8.055,1.163c.078,1.936.155,4.646.271,8.249l-5.073.348-.194-5.033-3.679-2.247h-.078l-8.365,1.238c.078,3.332.233,9.218.427,17.118.116,4.3.232,9.178.387,14.562.116,4.143.194,8.558.31,13.282.078,1.821.116,3.756.155,5.692.154,7.049.348,14.6.5,22.618.038,2.167.116,4.375.155,6.583-.039-1.781-.117-3.562-.155-5.306l-9.178.7s-1.123-17.35.814-19.751a8.693,8.693,0,0,1,7.862-2.672c-.039-1.859-.078-3.678-.155-5.461-1.51.62-3.8.349-7.357-1.083-3.06-1.2-1.51-13.517-1.51-13.517s5.228-.347,8.558,1.861c-.155-5.19-.271-9.875-.387-13.981a6.833,6.833,0,0,1-6.273,4.337,12.024,12.024,0,0,1-8.288-2.866v-20.061l-18.2,2.711c-.582,72.574-9.218,109.016-19.015,127.565-4.027-32.143-8.287-78.731-8.287-78.731l-15.452-2.981v-2.712l-36.364-5.42-7.784.619-.039-1.7c8.6.891,17.04,1.626,17.583,1.511,1.084-.155,3.8-2.053,3.8-2.053a82.63,82.63,0,0,0,2.013-8.017,30.709,30.709,0,0,0,0-5.576s7.357-3.95,7.087-5.692a54.379,54.379,0,0,0-1.394-5.422v-1.356a1.473,1.473,0,0,0,1.394-.968c.27-.93-1.085-5.149-1.24-6.35-.154-1.241,1.047-21.571,1.279-22.423.232-.812,1.046,0,1.046,0l.658,1.782a6.429,6.429,0,0,0,2.594,1.2c.93,0,4.222-2.208,3.8-3.332s.233-4.259.039-4.646c-.155-.426,1.046-8.288.038-12.78-1.007-4.453-1.433-8.132-1.433-8.132l-.427-1.355.852-.658a31.108,31.108,0,0,1-2.748-4.222,92.925,92.925,0,0,1-5.423-13.4c-1.549-4.879-3.175-6.157-5.228-7.318a29.123,29.123,0,0,0-4.995-2.092v-1.162H763.8s-.271-1.472,0-1.82,2.247-.62,2.634-2.44c.349-1.82.93-2.439.387-5.963s-1.123-5.578-3.137-6.662-5.654-2.594-7.281-1.626c-1.665.968-6.661,1.742-4.763,13.012a13.588,13.588,0,0,0,3.37,4.492l.7,3.68a4.569,4.569,0,0,1-3.8,1.2c-2.169-.388-3.137-.388-3.137-.813a7.419,7.419,0,0,0-3.8-3.524c-2.014-.7-7.474-2.167-8.288-2.981s-4.181-3.253-4.181-3.253l-.969.813a92.625,92.625,0,0,0-8.752-12.16c-5.5-6.507-3.989-9.488-4.454-12.277-.5-2.788-5.925-6.119-6.661-7.28-.774-1.161-3.679-4.144-4.028-4.531-.5-.621-2.129-.039-1.277,1.355,1.472,2.324,3.757,4.609,3.486,4.647a7.86,7.86,0,0,0-3.563,1.627s.078,2.014,0,2.981a17.3,17.3,0,0,0,.542,4.1c.232.233,3.408,1.356,4.57,3.137a40.764,40.764,0,0,1,3.059,5.577c.039.387,7.359,14.251,9.334,16.072,2.013,1.82,3.989,3.794,3.989,3.794l.619.465a75.081,75.081,0,0,0-.813,8.211c.928,1.006,6.621,2.283,7.551,2.71.891.466,5.848,2.362,6.119,2.633s1.549,1.278,1.549,1.278a10.55,10.55,0,0,1-1.7,2.982,7.629,7.629,0,0,0-1.471,5.963c.464,1.821-.078,3.99.464,4.377.542.426-.387,1.936.271,2.052.658.155-1.084,3.757.271,3.021,1.356-.7.387,4.183.387,4.569a143.443,143.443,0,0,0,1.51,14.678c.968,4.725,1.239,7.32,1.9,6.622.658-.658.658,3.292.658,4.1s1.394,8.249.852,9.372c-.581,1.046-.155.775-.581,2.13-.387,1.394-.658,3.679-.93,4.647-.271.93-2.71,11.27-2.71,11.27s-1.9,2.285-.969,2.285c.969,0-1.742,1.006-1.393,2.169s.038,1.355-.271,2.247a5.055,5.055,0,0,0-.155,2.168,11.644,11.644,0,0,0-4.144,2.709c-1.471,1.783-1.626,1.512-2.826,1.59-1.239.038-3.6-.5-3.679.735-.078,1.2.736,2.634,2.672,3.795a9.989,9.989,0,0,0,2.169.542l-34.815,4.492.271,4.532-9.526.813-3.408,26.526H671.087l-7.551,23.663V1520.4h3.833v-6.428h-3.833v-4.609h4.337l4.531-4.608V1500.1h-6.428v-5.771H664.7v-22.847h1.742v-1.82H664.7v-2.943H568.85v-15.685h-8.481V1408.4L545.3,1421.218h-5.267l-6-18.434-5.964,18.434h-5.306L507.7,1408.4v42.638H499.22v15.685H403.372v2.943H401.63v1.82h1.742v22.847h-1.277v5.771h-6.429v4.648l4.531,4.608h4.338v4.609H400.7v6.428h3.524v84.811c-1.317-.039-2.439-.078-2.439-.542.038-7.862,1.046-17.813.89-22.113-.271-7.125-3.563-28.154-4.1-34.156-.155-1.9-.7-5.111-1.433-8.792-.271-1.2-.543-2.478-.814-3.795-.852-4.181-1.9-8.636-2.788-12.392-.658-2.71-1.2-5.073-1.626-6.738-.7-2.556-1.472-7.28-2.867-12.9a85.972,85.972,0,0,0-5.422-15.916,51.65,51.65,0,0,0-9.1-14.058c-13.09-14.214-17.194-17.273-20.215-17.273s-12.044,6.739-16.807,16.42c-.078.155-.154.311-.232.465l-7.281-.621c.814.543,5.15.66,7.241.7-3.794,7.59-6.505,10.727-11.075,30.981-1.007,4.375-2.091,9.564-3.292,15.761l-.658,2.479v.038h-6.7c-.736-3.6-1.859-8.364-2.6-11.114-1.239-4.532-2.207-11.5-4.376-12.044s-6.274-2.71-9.139,10.378a120.143,120.143,0,0,0-1.666,12.2c-12.547-.852-23.158-2.208-35.163-2.208h-3.912c-.7-4.222-1.393-8.366-1.9-10.649-.968-4.26-.425-11.619-3.562-13.4s-6.97-1.512-8.211,2.594c-.774,2.595-2.014,13.282-2.75,21.144-5.615-.154-11.5-.31-17.348-.426-.155-.736-.271-1.316-.387-1.744-1.085-5.188-5.074-17.736-6.971-21.454-1.9-3.678-6.816-5.847-8.752-3.406-.968,1.277-4.415,13.63-7.746,26.023-6.351-.155-12.934-.31-19.014-.426-.542-5.111-1.743-26.218-9.1-24.126-2.44.7-6.351,18.938-6.158,22.23,0,.386-.038.968-.116,1.7-1.666,0-3.176.038-4.492.038-3.1-5.537-9.915-17.621-11.579-19.828a23.588,23.588,0,0,0-5.19-4.84s1.239-1.2,0-2.015c-1.239-.851-2.053-4.841-2.866-1.625a10.284,10.284,0,0,1-1.085,1.82c-1.006,2.168.465,2.091.465,2.091s-2.014,1.858-3.021,2.594c-.89.658-10.921,13.361-13.631,21.8h-.349v-1.51c0-6.273-2.323-11.464-2.75-14.135-.387-2.673-2.478-12.044-4.414-6.7,0,0-3.641,8.908-3.641,13.128,0,1.7-.852,5.268-1.9,9.1-4.26-.039-8.442-.078-12.431-.117-.774-.928-1.936-2.362-3.059-3.563a10.025,10.025,0,0,0-2.827-2.479c-1.471-.5-3.485,4.687-3.911,5.926-2.207-.038-4.26-.038-6.118-.078H83.8a29.378,29.378,0,0,0-1.782-5.771c-1.471-3.562-2.9-6.854-5.46-5.924-1.859.62-5.228,6.545-6.932,9.759a1.577,1.577,0,0,1-.349-1.2c.271-1.084-3.292-19.672-5.19-28.424-.774-3.486-2.594-3.176-4.763-1.046-3.214,3.214-7.281,10.417-9.759,14.715-4.066,7.087-17.194,34.156-27.844,65.564-10.262,30.206-8.365,43.761-8.211,44.768-5.228.426-10.8.658-12.314,2.595a9.544,9.544,0,0,0-.891,3.484H0v130.421H2392.352V1616.166h-24.01l.039-.852,23.971.7v-13.863l-9.991-.5.155-2.556a16.46,16.46,0,0,0,9.836-2.749,15.949,15.949,0,0,0,3.06-2.827,19.95,19.95,0,0,0,3.639-7.668,43.063,43.063,0,0,0,.581-14.949Zm-1907.886,44.69H468.084V1520.4h16.382Zm83.532,0H499.8V1520.4H568Zm31.485,0H583.256V1520.4h16.226Zm264.151-.27h-.425l.038.27h-8.714v-51.738l16.149-.465C869.83,1590.724,865.958,1607.879,863.634,1615.9Zm21.145.27h-2.943c.078-.852.194-1.7.31-2.556h2.866c-.116.813-.194,1.588-.27,2.286Zm31.717-85.081-9.643,1.239s-1.587-18.007,0-20.564a7.325,7.325,0,0,1,8.288-2.828Zm-11.5-42.948s6.235-.736,9.023,2.789l.7,10.919c-1.122,1.821-3.446,2.13-7.862.311C904.064,1500.995,904.993,1488.137,904.993,1488.137Zm-2.556,128.029c2.285-22.035.814-45.928.814-45.928l-.349-6.622H918.47l3.214,52.55Zm180.852,0h-24.475v-11.115h24.475Zm50.421,0h-43.876v-11.115h43.876Zm.93-31.019h-5.77v-5.229h-56.85v12.741h-8.481v-21.88h-3.6v-9.139h76.407c-7.63,4.027-7.552,6.583.619,8.79a4.98,4.98,0,0,0,.5.117Zm41.436,31.019h-35.861V1606.1c3.873,1.047,10.3,1.743,17.621,1.743,7.706,0,14.484-.774,18.24-1.937Zm-36.17-37.565,1.472-7.667c8.249.463,24.9.463,34,.038l1.472,7.628Zm39.153-107.929v24.009h-19.519v-24.009c0-.465-.194-.853-.465-.853-.232,0-.426.388-.426.853v24.009h-19.557v-24.009c0-.465-.194-.853-.427-.853-.271,0-.465.388-.465.853v24.009h-45.852c33.731-57.043,67.888-58.979,67.888-58.979s34.156,1.936,67.887,58.979H1179.95v-24.009c0-.465-.194-.853-.465-.853C1179.253,1469.819,1179.059,1470.207,1179.059,1470.672Zm1.782,107.929-1.51-7.861a10.458,10.458,0,0,0,1.9-.31c8.171-2.207,8.209-4.763.619-8.79H1260.5v9.139h-3.563v21.88h-8.519v-12.741h-56.812v5.229h-9.256V1578.6Zm46.2,37.565h-44.42v-11.115h44.42Zm36.6-10.882h-1.588v10.882h-28.464v-11.115h30.052ZM1468.5,1355.151c-6.7,3.6-9.372,7.823-9.915,8.714v-8.055a17.212,17.212,0,0,1,6.7-8.094c.968-.582,2.052-1.2,3.215-1.781Zm9.488-3.562a40.758,40.758,0,0,0-8.249,2.9v-9.179a44.892,44.892,0,0,1,8.6-2.788C1478.219,1344.927,1478.064,1348.878,1477.987,1351.589Zm38.649,2.092a47.9,47.9,0,0,0-9.488-2.712c-.194-2.478-.465-6.235-.658-8.753a42.332,42.332,0,0,1,10.146,3.913Zm1.239-6.777c3.989,2.477,6.816,5.537,7.978,8.906v3.949a23.81,23.81,0,0,0-7.978-5.5Zm127.8,262.8h-62.04v6.467h-3.641l-.077-26.565h3.718v13.553h.038v6.467h61.962v-6.467h.039Zm111.454-1.82-7.668,1.82H1648.692v-6.545h9.45a4.864,4.864,0,0,1-.774.774c-.387.311-.736,1.24-1.7.582-.194,0-.93.813-1.51,1.083-.7.349,1.394.039.774.5l4.3.891h3.486c.078-.426-.232-2.478-.349-3.834h14.484v-.038l22.152-2.053h16.109c-.194,4.415-.349,7.435-.349,7.435s3.525,1.472,3.37-.348c-.078-1.123-.116-3.6-.116-7.087h39.113Zm9.759-99.8h97.2v.039h-97.2Zm-5.693,105.3.038-.04h28.58V1609.7h10.727v.193h29.974v-.193h10.96v3.639h28.58l.038.04Zm221.4-3.679H1881.824l-7.939-1.9v-6.738h34.234c-.232,4.415-.387,7.435-.387,7.435s3.524,1.472,3.369-.348c-.077-1.123-.077-3.6-.077-7.087h21.261l22.151,2.053v.038h2.518c.7,1.045.541,1.82-.7,2.867-.387.308-.736,1.2-1.7.541-.194,0-.968.813-1.51,1.124-.7.349,1.394.038.776.464l4.3.892c-.04,0,3.486.039,3.486,0,.116-.582-.582-4.455-.311-5.036.155-.271.311-.581.5-.852h20.8Zm107.233-28.5,39.191-9.953a.566.566,0,0,0,.038.231Zm121.057-3.563-77.568-5.925v-.387l27.3,2.285v.078l2.982.154,47.284,3.64Zm41.979,3.176-40.818-3.1,5.655.387,3.757.232c-.039,0-.039-.038-.039-.078l31.445,2.4Zm31.8,2.439-24.515-1.9a.141.141,0,0,1-.038-.116l24.553,1.858Zm28.657,1.007q.057.58.116,1.162l-22.539-1.7v-.154l6.313.5.232-2.168a108.539,108.539,0,0,0,16.924-4.183,14.086,14.086,0,0,0-1.046,6.505l-.117.04Zm18.705,27.263-13.942.582-.542-.271h.116l.232.038v-.078l14.136-.31Zm17.7-14.949,1.045-.077,12.2,1.008Z" transform="translate(0 -1324.674)" fill="#060227"/>
</svg>
''',
                alignment: Alignment.bottomCenter,
              ),
              Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GBloxCards(
                          svg: svgs.codeMode,
                          text: "Code",
                          textBackgroundColor: Colors.orange,
                          pressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Blockly()),
                            );
                          },
                        ),
                        GBloxCards(
                          svg: svgs.playMode,
                          text: "Play",
                          textBackgroundColor: Colors.purple,
                          pressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PlaySelector()),
                            );
                          },
                        ),
                        GBloxCards(
                          svg: svgs.buildMode,
                          text: "Build",
                          textBackgroundColor: const Color(0xffFA857B),
                        ),
                      ]))
            ]))));
  }
}
