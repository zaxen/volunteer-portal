package au.org.ala.volunteer.marshaller

import au.org.ala.volunteer.TemplateField
import grails.converters.JSON

/*
 * Copyright (C) 2017 Atlas of Living Australia
 * All Rights Reserved.
 *
 * The contents of this file are subject to the Mozilla Public
 * License Version 1.1 (the "License"); you may not use this file
 * except in compliance with the License. You may obtain a copy of
 * the License at http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS
 * IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
 * implied. See the License for the specific language governing
 * rights and limitations under the License.
 * 
 * Created by Temi on 1/2/17.
 */

class TemplateFieldMarshaller {
    void register() {
        JSON.registerObjectMarshaller(TemplateField) { TemplateField tField ->
            return [
                    label: tField.label
            ]
        }
    }
}
