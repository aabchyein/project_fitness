package com.the_glory.project_fitness.UniqueID;

import java.util.UUID;

public class UniqueID {
        public String generatUuid() {

        return UUID.randomUUID().toString();
    }
}

// <%@ import = "com.the_glory.project_fitness.UniqueID.UniqueID"; %>

// <%       
// UniqueID uniqueid = new UniqueID();
// String uuid = uniqueid.generatUuid();
// %>

//  hidden value = uuid