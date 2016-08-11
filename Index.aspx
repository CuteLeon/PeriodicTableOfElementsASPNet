<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Index.aspx.vb" Inherits="Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" http-equiv="Content-Type" content="text/html; charset=utf-8;width=device-width; user-scalable=no; minimum-scale=1.0; maximum-scale=1.0"/>
	<title>3D-元素周期表</title>
    <style >
        #BackButton{
            margin :2px;
            border :0px;
            position:absolute;
            width:118px;
            height :26px;
            left :9px;
            top:0px;
        }
        #UserButton {
            margin :2px;
            border :0px;
            position:absolute;
            width:118px;
            height :26px;
            left :131px;
            top:0px;
        }
    </style>
</head>
<body>
    <link href="css/index.css" rel="stylesheet"/>
	<script src="js/three.min.js" ></script>
	<script src="js/tween.min.js" ></script>
	<script src="js/TrackballControls.js" ></script>
	<script src="js/CSS3DRenderer.js" ></script>

    <form id="IndexForm" runat="server" >
		<div id="info">3D-元素周期表
        <asp:Button ID="BackButton" CssClass="CustomButton" OnClick="BackButton_Click" runat="server" Text="返回" />
        <asp:Button ID="UserButton" CssClass="CustomButton" OnClick ="UserButton_Click" runat="server" Text="UserName" />

		</div><!--网页顶部标题-->
        <div id="container"></div><!--用来放置3D场景的DIV-->
		<div id="controller" ><!--左侧控制面板-->
			<div id="logoimage" style="background:url(image/shield.png) no-repeat center"><input id="ColorPicker" type="color" style="visibility:hidden;" /></div>
			<div class="CustomButton" id="table">表面</div>
			<div class="CustomButton" id="sphere">球体</div>
			<div class="CustomButton" id="helix">螺旋</div>
			<div class="CustomButton" id="grid">网格</div>
            <div class="CustomButton" id="ColorPickerButton" onclick="onColorPicker();">颜色</div>
		</div>
		<div id="elementdetailPanel"><!--右侧详情面板-->
			<div id="elementImage" style="background:url(image/Shield.png) no-repeat center"></div>
			<div id="elementSymbol">Symbol</div>
			<div id="elementNumber">Number</div>
			<div id="elementDetail">Detail</div>
		</div>
    </form>

    <script>
        var table = ["H", "Hydrogen", "1.00794", 1, 1, "He", "Helium", "4.002602", 18, 1, "Li", "Lithium", "#6.941", 1, 2, "Be", "Beryllium", "9.012182", 2, 2, "B", "Boron", "#10.811", 13, 2, "C", "Carbon", "#12.0107", 14, 2, "N", "Nitrogen", "#14.0067", 15, 2, "O", "Oxygen", "#15.9994", 16, 2, "F", "Fluorine", "18.9984032", 17, 2, "Ne", "Neon", "#20.1797", 18, 2, "Na", "Sodium", "22.98976...", 1, 3, "Mg", "Magnesium", "#24.305", 2, 3, "Al", "Aluminium", "26.9815386", 13, 3, "Si", "Silicon", "#28.0855", 14, 3, "P", "Phosphorus", "30.973762", 15, 3, "S", "Sulfur", "#32.065", 16, 3, "Cl", "Chlorine", "#35.453", 17, 3, "Ar", "Argon", "#39.948", 18, 3, "K", "Potassium", "#39.948", 1, 4, "Ca", "Calcium", "#40.078", 2, 4, "Sc", "Scandium", "44.955912", 3, 4, "Ti", "Titanium", "#47.867", 4, 4, "V", "Vanadium", "#50.9415", 5, 4, "Cr", "Chromium", "#51.9961", 6, 4, "Mn", "Manganese", "54.938045", 7, 4, "Fe", "Iron", "#55.845", 8, 4, "Co", "Cobalt", "58.933195", 9, 4, "Ni", "Nickel", "#58.6934", 10, 4, "Cu", "Copper", "#63.546", 11, 4, "Zn", "Zinc", "#65.38", 12, 4, "Ga", "Gallium", "#69.723", 13, 4, "Ge", "Germanium", "#72.63", 14, 4, "As", "Arsenic", "#74.9216", 15, 4, "Se", "Selenium", "#78.96", 16, 4, "Br", "Bromine", "#79.904", 17, 4, "Kr", "Krypton", "#83.798", 18, 4, "Rb", "Rubidium", "#85.4678", 1, 5, "Sr", "Strontium", "#87.62", 2, 5, "Y", "Yttrium", "88.90585", 3, 5, "Zr", "Zirconium", "#91.224", 4, 5, "Nb", "Niobium", "92.90628", 5, 5, "Mo", "Molybdenum", "#95.96", 6, 5, "Tc", "Technetium", "(98)", 7, 5, "Ru", "Ruthenium", "#101.07", 8, 5, "Rh", "Rhodium", "#102.9055", 9, 5, "Pd", "Palladium", "#106.42", 10, 5, "Ag", "Silver", "#107.8682", 11, 5, "Cd", "Cadmium", "#112.411", 12, 5, "In", "Indium", "#114.818", 13, 5, "Sn", "Tin", "#118.71", 14, 5, "Sb", "Antimony", "#121.76", 15, 5, "Te", "Tellurium", "127.6", 16, 5, "I", "Iodine", "126.90447", 17, 5, "Xe", "Xenon", "#131.293", 18, 5, "Cs", "Caesium", "#132.9054", 1, 6, "Ba", "Barium", "#132.9054", 2, 6, "La", "Lanthanum", "138.90547", 4, 9, "Ce", "Cerium", "#140.116", 5, 9, "Pr", "Praseodymium", "140.90765", 6, 9, "Nd", "Neodymium", "#144.242", 7, 9, "Pm", "Promethium", "(145)", 8, 9, "Sm", "Samarium", "#150.36", 9, 9, "Eu", "Europium", "#151.964", 10, 9, "Gd", "Gadolinium", "#157.25", 11, 9, "Tb", "Terbium", "158.92535", 12, 9, "Dy", "Dysprosium", "162.5", 13, 9, "Ho", "Holmium", "164.93032", 14, 9, "Er", "Erbium", "#167.259", 15, 9, "Tm", "Thulium", "168.93421", 16, 9, "Yb", "Ytterbium", "#173.054", 17, 9, "Lu", "Lutetium", "#174.9668", 18, 9, "Hf", "Hafnium", "#178.49", 4, 6, "Ta", "Tantalum", "180.94788", 5, 6, "W", "Tungsten", "#183.84", 6, 6, "Re", "Rhenium", "#186.207", 7, 6, "Os", "Osmium", "#190.23", 8, 6, "Ir", "Iridium", "#192.217", 9, 6, "Pt", "Platinum", "#195.084", 10, 6, "Au", "Gold", "196.966569", 11, 6, "Hg", "Mercury", "#200.59", 12, 6, "Tl", "Thallium", "#204.3833", 13, 6, "Pb", "Lead", "207.2", 14, 6, "Bi", "Bismuth", "#208.9804", 15, 6, "Po", "Polonium", "(209)", 16, 6, "At", "Astatine", "(210)", 17, 6, "Rn", "Radon", "(222)", 18, 6, "Fr", "Francium", "(223)", 1, 7, "Ra", "Radium", "(226)", 2, 7, "Ac", "Actinium", "(227)", 4, 10, "Th", "Thorium", "232.03806", 5, 10, "Pa", "Protactinium", "#231.0588", 6, 10, "U", "Uranium", "238.02891", 7, 10, "Np", "Neptunium", "(237)", 8, 10, "Pu", "Plutonium", "(244)", 9, 10, "Am", "Americium", "(243)", 10, 10, "Cm", "Curium", "(247)", 11, 10, "Bk", "Berkelium", "(247)", 12, 10, "Cf", "Californium", "(251)", 13, 10, "Es", "Einstenium", "(252)", 14, 10, "Fm", "Fermium", "(257)", 15, 10, "Md", "Mendelevium", "(258)", 16, 10, "No", "Nobelium", "(259)", 17, 10, "Lr", "Lawrencium", "(262)", 18, 10, "Rf", "Rutherfordium", "(267)", 4, 7, "Db", "Dubnium", "(268)", 5, 7, "Sg", "Seaborgium", "(271)", 6, 7, "Bh", "Bohrium", "(272)", 7, 7, "Hs", "Hassium", "(270)", 8, 7, "Mt", "Meitnerium", "(276)", 9, 7, "Ds", "Darmstadium", "(281)", 10, 7, "Rg", "Roentgenium", "(280)", 11, 7, "Cn", "Copernicium", "(285)", 12, 7, "Uut", "Unutrium", "(284)", 13, 7, "Fl", "Flerovium", "(289)", 14, 7, "Uup", "Ununpentium", "(288)", 15, 7, "Lv", "Livermorium", "(293)", 16, 7, "Uus", "Ununseptium", "(294)", 17, 7, "Uuo", "Ununoctium", "(294)", 18, 7];
        var Element_Count = table.length / 5;//元素个数
        var Table_Line = 18;//表面布局，每行个数
        var Table_Columns = 10;//表面布局，每列个数
        var Table_Width = (Table_Line + 1) * 70;//自动计算表的宽度和高度，已自动对准3D场景的旋转中心
        var Table_Height = (Table_Columns + 1) * 90;

        var Sphere_Radius = Element_Count * 8;//根据元素个数确定球半径
        if (Sphere_Radius < 500) Sphere_Radius = 500;//球最小半径不小于500

        var Helix_Radius = 800;//螺旋半径常量
        var Grid_Radius = 800;

        var camera, scene, renderer;//3D！！！
        var controls;

        var objects = []
        var targets = { table: [], sphere: [], helix: [], grid: [] };

        //后面点击元素显示元素详情时用到，定义在公共变量区，减少函数执行次数，节约性能
        var elementImage = document.getElementById('elementImage');
        var elementSymbol = document.getElementById('elementSymbol');
        var elementNumber = document.getElementById('elementNumber');

        //Let's do IT !!!
        init();
        animate();

        function init() {
            //我也不知道自己为什么不删掉这行...我闲的...
            info.style.backgroundColor = 'rgba(0,0,0,0.3)';

            //初始化相机
            camera = new THREE.PerspectiveCamera(50, window.innerWidth / window.innerHeight, 1, 10000);
            camera.position.z = 3000;

            scene = new THREE.Scene();

            // 表面布局
            for (var i = 0; i < table.length; i += 5) {
                //兼顾动态创建元素的作用
                var element = document.createElement('div');
                element.className = 'element';
                element.style.backgroundColor = 'rgba(0,127,127,' + (Math.random() * 0.5 + 0.25) + ')';
                //元素符号
                var symbol = document.createElement('div');
                symbol.className = 'symbol';
                symbol.style.background = "url(./image/Element_" + Math.floor(Math.random() * 23) + ".png) no-repeat center";
                symbol.textContent = table[i];
                element.appendChild(symbol);
                //元素标识
                var number = document.createElement('div');
                number.className = 'number';
                number.textContent = (i / 5) + 1;
                element.appendChild(number);
                //元素详情
                var details = document.createElement('div');
                details.className = 'details';
                details.innerHTML = table[i + 1] + '<br>' + table[i + 2];
                element.appendChild(details);

                //为每个元素添加点击事件，但是过多事件监听会影响性能，所以把事件统一交给3D场景容器处理
                //element.addEventListener( 'click',onElementClick);

                //随机放置位置
                var object = new THREE.CSS3DObject(element);
                object.position.x = Math.random() * 4000 - 2000;
                object.position.y = Math.random() * 4000 - 2000;
                object.position.z = Math.random() * 4000 - 2000;
                scene.add(object);
                //
                objects.push(object);

                //表面布局
                var object = new THREE.Object3D();
                object.position.x = (table[i + 3] * 140) - Table_Width;
                object.position.y = -(table[i + 4] * 180) + Table_Height;

                targets.table.push(object);
            }

            // 球体布局
            var vector = new THREE.Vector3();
            for (var i = 0, l = objects.length; i < l; i++) {
                var phi = Math.acos(-1 + (2 * i) / l);
                var theta = Math.sqrt(l * Math.PI) * phi;

                var object = new THREE.Object3D();
                //计算3D坐标
                object.position.x = Sphere_Radius * Math.cos(theta) * Math.sin(phi);
                object.position.y = Sphere_Radius * Math.sin(theta) * Math.sin(phi);
                object.position.z = Sphere_Radius * Math.cos(phi);
                //设置方向
                vector.copy(object.position).multiplyScalar(2);
                object.lookAt(vector);

                //开始布局
                targets.sphere.push(object);
            }

            // 螺旋布局
            var vector = new THREE.Vector3();
            for (var i = 0, l = objects.length; i < l; i++) {
                var phi = i * 0.175 + Math.PI;

                var object = new THREE.Object3D();
                //计算3D坐标
                object.position.x = Helix_Radius * Math.sin(phi);
                object.position.y = -(i * 8) + (l * 4);
                object.position.z = Helix_Radius * Math.cos(phi);
                //计算方向
                vector.x = object.position.x * 2;
                vector.y = object.position.y;
                vector.z = object.position.z * 2;

                object.lookAt(vector);
                //开始布局
                targets.helix.push(object);
            }

            // 立体表格
            for (var i = 0, l = objects.length; i < l; i++) {
                var object = new THREE.Object3D();
                //计算坐标(每页5行5列，共计25个元素)
                object.position.x = ((i % 5) * Grid_Radius / 2) - Grid_Radius;
                object.position.y = (-(Math.floor(i / 5) % 5) * Grid_Radius / 2) + Grid_Radius;
                object.position.z = (Math.floor(i / 25)) * Grid_Radius - (Math.floor(l / 25) / 2) * Grid_Radius;

                targets.grid.push(object);
            }

            //3D场景
            renderer = new THREE.CSS3DRenderer();
            renderer.setSize(window.innerWidth, window.innerHeight);
            renderer.domElement.style.position = 'absolute';//场景采用绝对布局
            document.getElementById('container').appendChild(renderer.domElement);//放置3D场景

            //3D场景的事件监听，对元素的事件冒泡到这里统一处理，节约性能
            renderer.domElement.addEventListener('click', onDocumentClick, true);
            //为3D场景设置背景图
            renderer.domElement.style.backgroundImage = "url(Image/RendererBackground.jpg)";
            renderer.domElement.style.backgroundSize = "100% 100%";//拉伸图像尺寸
            //对3D场景的所有操作都可以对 [renderer.domElement.style] 实现
            
            controls = new THREE.TrackballControls(camera, renderer.domElement);
            controls.rotateSpeed = 0.5;
            //相机的最小距离和最大距离
            controls.minDistance = 500;
            controls.maxDistance = 6000;

            controls.addEventListener('change', render);

            //为四种布局按钮绑定事件
            var button = document.getElementById('table');
            button.addEventListener('click', function (event) { transform(targets.table, 2000); }, false);

            var button = document.getElementById('sphere');
            button.addEventListener('click', function (event) { transform(targets.sphere, 2000); }, false);

            var button = document.getElementById('helix');
            button.addEventListener('click', function (event) { transform(targets.helix, 2000); }, false);

            var button = document.getElementById('grid');
            button.addEventListener('click', function (event) { transform(targets.grid, 2000); }, false);

            //页面加载时采用的初始布局
            transform(targets.table, 3000);

            //禁止用户使用鼠标选中网页内容！神体验！！！
            document.onselectstart = function () { return false; };
            //监听窗口尺寸改变
            window.addEventListener('resize', onWindowResize, false);
        }

        //转换
        function transform(targets, duration) {
            TWEEN.removeAll();
            for (var i = 0; i < objects.length; i++) {
                var object = objects[i];
                var target = targets[i];
                new TWEEN.Tween(object.position)
                    .to({ x: target.position.x, y: target.position.y, z: target.position.z }, Math.random() * duration + duration)
                    .easing(TWEEN.Easing.Exponential.InOut)
                    .start();

                new TWEEN.Tween(object.rotation)
                    .to({ x: target.rotation.x, y: target.rotation.y, z: target.rotation.z }, Math.random() * duration + duration)
                    .easing(TWEEN.Easing.Exponential.InOut)
                    .start();
            }
            new TWEEN.Tween(this)
                .to({}, duration * 2)
                .onUpdate(render)
                .start();
        }

        //窗口尺寸改变，自适应3D场景
        function onWindowResize() {
            camera.aspect = window.innerWidth / window.innerHeight;
            camera.updateProjectionMatrix();

            renderer.setSize(window.innerWidth, window.innerHeight);

            render();
        }

        //推动
        function animate() {
            requestAnimationFrame(animate);

            TWEEN.update();

            controls.update();
        }

        //着色
        function render() {
            renderer.render(scene, camera);
        }

        //3D场景点击事件
        function onDocumentClick() {
            //TODO：这里元素内子元素只有一层，所以只需要parentNode即可处理，当内涵多层元素时，应对应修改下方获取容器的代码
            var element = event.target;//这里是触发事件的对象，可以单独处理
            if (element.className != "element") element = element.parentNode;//对象为子元素时，获取父容器（子元素只有一层）
            if (element.className != "element") return 0;//此时对象为3D场景（此时不处理）
            var childElement = element.getElementsByClassName('symbol')[0];
            elementImage.style.background = childElement.style.background;
            elementSymbol.innerHTML = childElement.textContent;
            childElement = element.getElementsByClassName('number')[0]
            elementNumber.innerHTML = childElement.textContent;
            childElement = element.getElementsByClassName('details')[0]
            elementDetail.innerHTML = childElement.innerHTML;
        }

        //3D元素点击事件（禁用）
        function onElementClick() {
            alert(event.target.textContent);
        }

        //改变元素颜色
        function onColorPicker() {
            var ColorPicker = document.getElementById("ColorPicker");
            ColorPicker.click();//显示颜色拾取器
            ColorPicker.onchange = function () {
                //颜色拾取器Value发生改变
                var Color = ColorPicker.value;
                var Element = document.getElementsByClassName("element");
                for (var i = 0 ; i < Element.length; i++) {
                    //没有直接赋予Value，是为了设置透明度（parseInt(int,16)函数用于把16进制转换为10进制）
                    Element[i].style.backgroundColor = "rgba(" + parseInt(Color.substr(1, 2), 16) + "," + parseInt(Color.substr(3, 2), 16) + "," + parseInt(Color.substr(5, 2), 16) + ",0.25)";
                }
            }
        }
    </script>
</body>
</html>
