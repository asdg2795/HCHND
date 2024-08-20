package com.web.hchnd.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor
public class ProgramCompoVO {
    private double div;
    private int programNo;
    private String exercises;
    private int reps;
    private int sets;
    private String setsSeparation;
    private String prgname;
    private int reqRm;
    private int reqReps;
    private int reqRsets;
}
