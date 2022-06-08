
/* checkbox check 처리하기, radio 버튼 check 처리하기 select selected 처리 하기  */
        function AutoCheck(year, quarterstr, class_type_num, class_day) {

            
            let yearSelect = document.getElementById("year");
            let yearoptions = yearSelect.children;

            
            let quarterSelect = document.getElementById("quarter");
            let quarteroptions = quarterSelect.children;

            
            let classTypeSelect = document.getElementById("classType");
            let classTypeoptions = classTypeSelect.getElementsByTagName("input");

            
            let classDayCheckBox = document.getElementById("classDay");
            let classDayCheckRadios = classDayCheckBox.getElementsByTagName("input");
            let Sample = [];

            // 실제 넘어온 파라미터를 , 기준으로 쪼개서 배열로 만들어줌
            let classEachDay = class_day.split(',');

            /* input 태그의 value 들을 배열로 만들어서 밑에 RadiosValues 에 대입 , 요일 체크박스 초기화 */
            for(let i=0; i<classDayCheckRadios.length; i++){
                Sample[i] = classDayCheckRadios[i].value;
                // 요일 체크박스 초기화 -> 안하면 전에 체크되어있던것도 같이 체크 되어있음.
                classDayCheckRadios[i].checked = false;
            }

            /* 요일 checked */
            for(let i=0; i<classDayCheckRadios.length; i++){
                let RadiosValues = Sample; // 미리 담아두었던 input value 가 담긴 배열 넘겨줌.
                let classindex = [];
                classindex[i] = RadiosValues.indexOf(classEachDay[i]); // 실제 넘어온 파라미터의 값을 담고있는 원소의 index 값 배열에 담아줌. check 처리할때 인덱스 값에 들어가야할 변수.
                console.log("input 의 value 값 ====> " + RadiosValues);
                console.log("실제 체크된 요일 ====> " + classEachDay);

                // 실제 체크된 요일들이 포함되어있는지 확인 후에 checked 처리
                if(RadiosValues.includes(classEachDay[i])){
                    console.log("classIndex ==> " + classindex[i]);
                    console.log("HI");
                    classDayCheckRadios[classindex[i]].checked = true;
                }

            }

            /* 과정 유형 checked */
            for(let i =0; i<classTypeoptions.length; i++){
                if(class_type_num == classTypeoptions[i].value) {
                    classTypeoptions[i].checked = true;
                }
            }

            /* 년도 selected */
            for(let i=1; i < yearoptions.length; i++){
                if(year == yearoptions[i].text){
                    yearoptions[i].selected = true;
                }
            }

            /* 학기 selected */
            for(let i=1; i < quarteroptions.length; i++){
                if(quarterstr == quarteroptions[i].text){
                    quarteroptions[i].selected = true;
                }
            }
        }