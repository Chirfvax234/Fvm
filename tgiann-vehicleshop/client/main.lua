local IsInShopMenu, coreLoaded, inSuleyman = false, false, false
local PlayerData = {}
local currentDisplayVehicle, playerLastCoord, playerLastHeading = nil, nil, nil
local playerPed = PlayerPedId()
local playerCoords = GetEntityCoords(playerPed)
QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
	PlayerData = QBCore.Functions.GetPlayerData()
	coreLoaded = true
end)

local pedSpawned = false

local function whenStarted()
    if pedSpawned then return end
    local current = 'a_m_m_business_01'
    current = type(current) == 'string' and GetHashKey(current) or current
    RequestModel(current)
    while not HasModelLoaded(current) do Wait(0) end 
    GalleryPed = CreatePed(0, 'a_m_m_business_01', -34.54, -1106.32, 25.42, 72.08, false, false) 
    TaskStartScenarioInPlace(GalleryPed, 'WORLD_HUMAN_COP_IDLES', true)
    FreezeEntityPosition(GalleryPed, true)
    SetEntityInvincible(GalleryPed, true)
    SetBlockingOfNonTemporaryEvents(GalleryPed, true)

    exports['qb-target']:AddTargetModel(current, {
        options = {
            {
                type = "client",
				event = "ra1derVehicleShop:OpenShop",
                icon = "fas fa-car",
                label = "Galerici Sam",
            }
        },
        distance = 2.0
    })
    pedSpawned = true
end

-- Meslek Updatet
RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(job)
	PlayerData.job = job
end)

function getVehicleLabelFromModel(model)
	for k,v in pairs(Config.Vehicles) do
		for kk,vv in pairs(v) do
			if vv.model == model then
				return vv.name
			end
		end
	end
	return "Bilinmiyor"
end

Citizen.CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        local pedCoords = GetEntityCoords(playerPed)
		local ped = vector3(-32.85, -1102.09, 26.42)
        local distance = #(pedCoords - ped)
        inUI = false
        local time = 2500
		if QBCore.Functions.GetPlayerData().job.name == "cardealer" then
        if distance < 20 then
            time = 1000
            if distance < 2 then
				time = 1
                inUI = true
					exports['seind-ui']:TextDisplay("Galerici Eylemleri","galerici", "fas fa-car", "E");
					if IsControlJustReleased(0, 38) then
						TriggerEvent("ra1derVehicleShop:OpenSellerMenu")
					end
				end 
				if not inUI then
					exports['seind-ui']:HideText("galerici")
				end
			else
				exports['seind-ui']:HideText("galerici")
			end
        end
        Citizen.Wait(time)
    end
end)



Citizen.CreateThread(function()
	while true do
		local playerPed = PlayerPedId()
		local pedCoords = GetEntityCoords(playerPed)
		local patron = vector3(-32.04, -1114.15, 26.42)
			local distance = #(pedCoords - patron)
			inUI = false
			local time = 2500
			if QBCore.Functions.GetPlayerData().job.isboss then
				if distance < 20 then
				time = 1000
					if distance < 3 then
						time = 1
						inUI = true
						exports['seind-ui']:TextDisplay("Patron Eylemleri","patron", "fas fa-car", "E");
						if IsControlJustReleased(0, 38) then
							TriggerEvent("ra1derVehicleShop:OpenBossMenu")
						end
					end 
					if not inUI then
						exports['seind-ui']:HideText("patron")
					end
				else
					exports['seind-ui']:HideText("patron")	
				end
			end
			Citizen.Wait(time)
		end
end)


function ReturnVehicleProvider()
	QBCore.Functions.TriggerCallback('tgiann-vehicleshop:getCommercialVehicles', function(vehicles)
		local elements = {}

		if #vehicles > 0 then
			for k,v in ipairs(vehicles) do
				local returnPrice = QBCore.Shared.Round(v.price * 0.75)
				local vehicleLabel = getVehicleLabelFromModel(v.vehicle)
				table.insert(elements, {
					label = ('%s [<span style="color:orange;">%s</span>]'):format(vehicleLabel, "$"..QBCore.Shared.GroupDigits(returnPrice)),
					value = v.vehicle
				})
			end
		else
			table.insert(elements, {label = "Stokta Araç Yok!"})
		end

		QBCore.UI.Menu.Open('default', GetCurrentResourceName(), 'return_provider_menu', {
			title    = "araç Galerisi - Aracı üreticiye iade et",
			align    = 'top-left',
			elements = elements
		}, function(data, menu)
			if data.current.value then
				TriggerServerEvent('tgiann-vehicleshop:returnProvider', data.current.value)

				Citizen.Wait(300)
				menu.close()
				ReturnVehicleProvider()
			end
		end, function(data, menu)
			menu.close()
		end)
	end)
end


function StartShopRestriction()
	Citizen.CreateThread(function()
		IsInShopMenu = true
		while IsInShopMenu do
			Citizen.Wait(0)
			DisableAllControlActions(0)
			EnableControlAction(0, 1, true)
			EnableControlAction(0, 2, true)
		end
	end)
end

function OpenResellerMenu()
	QBCore.UI.Menu.CloseAll()
	QBCore.UI.Menu.Open('default', GetCurrentResourceName(), 'reseller', {
		title    = "Araç Galerisi",
		align    = 'top-left',
		elements = {
			{label = "Araç Satın Al", value = 'buy_vehicle'},
			{label = "Stoktan Araç Çıkart", value = 'pop_vehicle'},
			{label = "Aracı Stoğa Geri Koy", value = 'depop_vehicle'},
			{label = "Aracı Üreticiye İade Et", value = 'return_provider'},
			{label = "Fatura Oluştur", value = 'create_bill'},
			{label = "Aracı Ver [Yakındaki Oyuncu]", value = 'set_vehicle_owner_sell'},
		}
	}, function(data, menu)
		local action = data.current.value

		if action == 'buy_vehicle' then
			OpenShopMenu()
		elseif action == 'pop_vehicle' then
			OpenPopVehicleMenu()
			QBCore.Functions.Notify("Araç Stoktan Çıkartıldı, çıkartma noktasında")
		elseif action == 'depop_vehicle' then
			if currentDisplayVehicle then
				DeleteDisplayVehicleInsideShop()
				QBCore.Functions.Notify("Araç Stoğa Geri Koyuldu")
			else
				QBCore.Functions.Notify("Satılacak Araç Bulunamadı")
			end
		elseif action == 'return_provider' then
			ReturnVehicleProvider()
		elseif action == 'create_bill' then
			local closestPlayer, closestDistance = QBCore.Functions.GetClosestPlayer()

			if closestPlayer ~= -1 and closestDistance < 3 then
				QBCore.UI.Menu.Open('dialog', GetCurrentResourceName(), 'set_vehicle_owner_sell_amount', {
					title = "fatura Tutarı"
				}, function(data2, menu2)
					local amount = tonumber(data2.value)

					if amount == nil then
						QBCore.Functions.Notify("geçersiz Miktar")
					else
						menu2.close()
						local closestPlayer, closestDistance = QBCore.Functions.GetClosestPlayer()

						if closestPlayer == -1 or closestDistance > 3.0 then
							QBCore.Functions.Notify("Yakında oyuncu bulunamadı")
						else
							TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'cardealer', "araç Galerisi", tonumber(data2.value))
						end
					end
				end, function(data2, menu2)
					menu2.close()
				end)
			else
				QBCore.Functions.Notify("Yakında oyuncu bulunamadı")
			end
		elseif action == 'set_vehicle_owner_sell' then
			if currentDisplayVehicle then
				local closestPlayer, closestDistance = QBCore.Functions.GetClosestPlayer()
				if closestPlayer ~= -1 and closestDistance < 3 then
					local vehicleProps = {}
					vehicleProps.plate = GeneratePlate()
					QBCore.Functions.SetVehicleProperties(currentDisplayVehicle, vehicleProps)
					TriggerServerEvent('tgiann-vehicleshop:setVehicleOwnedPlayerId', GetPlayerServerId(closestPlayer), QBCore.Functions.GetVehicleProperties(currentDisplayVehicle), CurrentVehicleData.model, CurrentVehicleData.name, currentDisplayVehicle)
					currentDisplayVehicle = nil
					QBCore.UI.Menu.CloseAll()
				else
					QBCore.Functions.Notify("Yakında oyuncu bulunamadı")
				end
			else
				QBCore.Functions.Notify("Satılacak Araç Bulunamadı")
			end
		end
	end, function(data, menu)
		menu.close()
	end)
end

function OpenPopVehicleMenu()
	QBCore.Functions.TriggerCallback('tgiann-vehicleshop:getCommercialVehicles', function(vehicles)
		local elements = {}

		if #vehicles > 0 then
			for k,v in ipairs(vehicles) do
				local vehicleLabel = GetDisplayNameFromVehicleModel(v.vehicle)
				table.insert(elements, {
					label = ('%s [<span style="color:green;">%s</span>]'):format(vehicleLabel, "$"..QBCore.Shared.GroupDigits(v.price)),
					value = v.vehicle
				})
			end
		else
			table.insert(elements, {label = "Stokta Araç Yok!"})
		end

		QBCore.UI.Menu.Open('default', GetCurrentResourceName(), 'commercial_vehicles', {
			title    = "araç - araç Galerisi",
			align    = 'top-left',
			elements = elements
		}, function(data, menu)
			local model = data.current.value
			DeleteDisplayVehicleInsideShop()
			QBCore.Functions.SpawnVehicle(model, function(vehicle)
				currentDisplayVehicle = vehicle
				for Categories, car in pairs(Config.Vehicles) do 
					for hash, cars in pairs(Config.Vehicles[Categories]) do
						if GetHashKey(model) == GetHashKey(cars.model) then
							TriggerEvent("x-hotwire:give-keys", vehicle)
							CurrentVehicleData = cars
							break
						end
					end
				end
			end, Config.DealerCarSpawn, true)
		end, function(data, menu)
			menu.close()
		end)
	end)
end

function OpenBossActionsMenu()
	QBCore.UI.Menu.CloseAll()
	QBCore.Functions.TriggerCallback('tgiann-vehicleshop:suleymanDurum', function(durum)
		if durum then
			durumYazi = ('<span style="color:green;">%s</span>'):format("Aktif")
		else
			durumYazi = ('<span style="color:red;">%s</span>'):format("Pasif")
		end
		QBCore.UI.Menu.Open('default', GetCurrentResourceName(), 'reseller',{
			title    = "araç Galerisi - Patron",
			align    = 'top-left',
			elements = {
				{label = "Patron Aksiyonları", value = 'boss_actions'},
				{label = "Satılan Araçlar listesi", value = 'sold_vehicles'},
				{label = "Patron Deposu", value = 'patron_depo'},
				{label = "Sülayman Durum: ".. durumYazi, value = "sulo"}
		}}, function(data, menu)
			if data.current.value == 'boss_actions' then
				TriggerEvent("qb-bossmenu:client:OpenMenu")
			elseif data.current.value == 'sold_vehicles' then
				QBCore.Functions.TriggerCallback('tgiann-vehicleshop:getSoldVehicles', function(customers)
					local elements = {
						head = { "müşteri", "model", "plaka", "Satıcı","tarih" },
						rows = {}
					}

					for i=1, #customers, 1 do
						table.insert(elements.rows, {
							data = customers[i],
							cols = {
								customers[i].client,
								customers[i].model,
								customers[i].plate,
								customers[i].soldby,
								customers[i].date
							}
						})
					end

					QBCore.UI.Menu.Open('list', GetCurrentResourceName(), 'sold_vehicles', elements, function(data2, menu2)

					end, function(data2, menu2)
						menu2.close()
					end)
				end)
			elseif data.current.value == 'patron_depo' then
				TriggerEvent("inventory:client:SetCurrentStash", "cardealer_boss_stash", QBCore.Key)
				TriggerServerEvent("inventory:server:OpenInventory", "stash", "cardealer_boss_stash", {maxweight = 150000,slots = 50})
				QBCore.UI.Menu.CloseAll()
			elseif data.current.value == 'sulo' then
				if durum then
					QBCore.Functions.Notify("Süleyman Mesai Dışına Çıkarıldı")
					TriggerServerEvent("tgiann-vehicleshop:suleymanDurumDuzenle", false)
					menu.close()
					OpenBossActionsMenu()
				else
					QBCore.Functions.Notify("Süleyman Tekrar Mesaide")
					TriggerServerEvent("tgiann-vehicleshop:suleymanDurumDuzenle", true)
					menu.close()
					OpenBossActionsMenu()
				end
			end

		end, function(data, menu)
			menu.close()

		end)
	end)
end

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		if IsInShopMenu then
			SetNuiFocus(false,false)
			QBCore.UI.Menu.CloseAll()
			local playerPed = PlayerPedId()
			FreezeEntityPosition(playerPed, false)
			SetEntityVisible(playerPed, true)
			SetEntityCoords(playerPed, -33.7, -1102.0, 26.2)
			DeleteDisplayVehicleInsideShop()
		end
	end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        whenStarted()
    end
end)


Citizen.CreateThread(function()
	local blip = AddBlipForCoord(-33.7, -1102.0, 26.2)
	SetBlipSprite(blip, 326)
	SetBlipDisplay(blip, 4)
	SetBlipColour(blip, 3)
	SetBlipScale(blip, 0.59)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Araç Galerisi")
	EndTextCommandSetBlipName(blip)

	RequestIpl('shr_int')
	LoadInterior(7170)
	EnableInteriorProp(7170, 'csr_beforeMission')
	RefreshInterior(7170)
end)




Citizen.CreateThread(function()
	local time = 2500
    while true do
        local playerPed = PlayerPedId()
		local npc = vector3(-45.74, -1081.69, 25.94)
        local pedCoords = GetEntityCoords(playerPed)
        local distance = #(pedCoords - npc)
        inUI = false
		if distance < 4 then
			time = 0
			inUI = true
		    exports['seind-ui']:TextDisplay("Aracı Sat","aracısat", "fas fa-car", "E");
			if IsControlJustReleased(0, 38) then
				exports['seind-ui']:HideText("aracısat")
				ResellCar()
			end
		end 
		if not inUI then
			exports['seind-ui']:HideText("aracısat")
		end
        Citizen.Wait(time)
    end
end)



function OpenShopMenu_sifirsatici()
	openMenu(true)
end

function OpenShopMenu()
	openMenu(false)
end

function ResellCar()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    local price = 0
    local name = "Bilinmiyor"

    for Categories, car in pairs(Config.Vehicles) do 
        for hash, cars in pairs(Config.Vehicles[Categories]) do
            if hash == GetEntityModel(vehicle) then
                price = cars.price
                name = cars.name
                break
            end
        end
    end

    if price > 0 then
        local resellPrice = QBCore.Shared.Round(price / 100 * Config.ResellPercentage)

        QBCore.UI.Menu.Open('default', GetCurrentResourceName(), 'return_provider_menu', {
            title    = "Araç Galerisi - Aracı üreticiye iade et",
            align    = 'top-left',
            elements = {
                {label = "İptal", value ="cancel"},
                {label = "Aracı Sat ("..resellPrice.."$)", value = "sell"}
            }
        }, function(data, menu)
            menu.close()

            if data.current.value == "sell" then
                local model = GetEntityModel(vehicle)
                local plate = QBCore.Shared.Trim(GetVehicleNumberPlateText(vehicle))

                CurrentActionData = {
                    vehicle = vehicle,
                    label = name,
                    price = resellPrice,
                    model = model,
                    plate = plate
                }

                QBCore.Functions.TriggerCallback('tgiann-vehicleshop:resellVehicle', function(vehicleSold)
                    if vehicleSold then
                        print("giriyon mu")
                        QBCore.Functions.DeleteVehicle(CurrentActionData.vehicle)
                        QBCore.Functions.Notify(CurrentActionData.label.." " .. QBCore.Shared.GroupDigits(CurrentActionData.price) .. " $ fiyatına satıldı")
                    else
                        QBCore.Functions.Notify("Bu araç sana ait değil", "error")
                    end
                end, CurrentActionData.plate, CurrentActionData.model, CurrentActionData.price)
            end
        end, function(data, menu)
            menu.close()
        end)
    else
        QBCore.Functions.Notify("Bu Aracı Galeriye Geri Satamazsın", "error")
    end
end


CreateThread(function()
-- exports['qb-target']:AddBoxZone("reseller", vector3(-33.58, -1103.68, 25.01), 0.5, 0.5, {
-- 	name = "reseller",
-- 	heading = 248.23,
-- 	debugPoly = false,
-- 	minZ = 25.36,
-- 	maxZ = 26.67834,
-- }, {
-- 		options = {
-- 			{
-- 				type = "client",
--             	event = "ra1derVehicleShop:OpenSellerMenu",
-- 				icon = "fas fa-circle",
-- 				label = "Galerici Eylemleri",
-- 				job = "cardealer"
-- 			},
-- 		},
-- 		distance = 2.0
-- 	})
	
-- 	exports['qb-target']:AddBoxZone("patron", vector3(-33.01, -1114.49, 25.45), 1.5, 2.5, {
-- 	name = "patron",
-- 	heading = 71.23,
-- 	debugPoly = false,
-- 	minZ = 25.36,
-- 	maxZ = 26.67834,
-- }, {
-- 	options = {
-- 			{
-- 				type = "client",
--             	event = "ra1derVehicleShop:OpenBossMenu",
-- 				icon = "fas fa-circle",
-- 				label = "Patron Eylemleri",
-- 				job = "cardealer"
-- 			},
-- 		},
-- 		distance = 2.0
-- 	})

end)
	
RegisterNetEvent("ra1derVehicleShop:OpenShop", function()
	OpenShopMenu_sifirsatici()
	QBCore.Functions.Notify("Bu konumda bir hata ile karşılaşmışsan veya ekranında ki UI takılı kalmışsan F8 üzerinden (Slash (/) yazmadan) galerifix komutunu kullan!", "primary", "15000")
end)
	
	
	
RegisterNetEvent("ra1derVehicleShop:OpenSellerMenu", function()
	OpenResellerMenu()
end)


RegisterNetEvent("ra1derVehicleShop:OpenBossMenu", function()
	if PlayerData.job and PlayerData.job.isboss then
		OpenBossActionsMenu()
	end
end)

-- local hudackapa = false
-- RegisterCommand("hudackapa", function()
-- 	if hudackapa == false then 
-- 		TriggerEvent("tgiann-modernHud:ui", false)
-- 		print("kapadim")
-- 		hudackapa = true
-- 	else
-- 		TriggerEvent("tgiann-modernHud:ui", true)
-- 		print("actim")
-- 		hudackapa = false
-- 	end
-- end)


function openMenu(bool)
	TriggerEvent("chat:clear")
	TriggerEvent("tgiann-modernHud:ui", false)
	QBCore.UI.Menu.CloseAll()
	QBCore.Functions.TriggerCallback("tgiann-vehicleshop:checkCarData", function(result)
		StartShopRestriction()
		local playerPed = PlayerPedId()
		playerLastCoord, playerLastHeading = GetEntityCoords(playerPed), GetEntityHeading(playerPed)
		inSuleyman = bool
		SetNuiFocus(true,true)
		SendNUIMessage({type = 'open', carData = result, suleyman = inSuleyman})
	end)
end

RegisterNUICallback('getCarDataAndSpawnCar', function(data, cb)
	QBCore.Functions.SpawnVehicle(data.model, function(vehicle)
		if currentDisplayVehicle ~= nil then DeleteDisplayVehicleInsideShop() end
		currentDisplayVehicle = vehicle
		TaskWarpPedIntoVehicle(PlayerPedId(), currentDisplayVehicle, -1)
		FreezeEntityPosition(currentDisplayVehicle, true)
		SetModelAsNoLongerNeeded(data.model)
		SetVehicleEngineOn(vehicle, true, true, true)

		cb({
			topspeed = math.ceil(GetVehicleHandlingFloat(currentDisplayVehicle, 'CHandlingData', 'fInitialDriveMaxFlatVel') / 1.9),
			accel = math.ceil(GetVehicleHandlingFloat(currentDisplayVehicle, 'CHandlingData', 'fInitialDriveForce') * 245),
			braking = math.ceil(GetVehicleHandlingFloat(currentDisplayVehicle, 'CHandlingData', 'fBrakeForce') * 32),
			handling = math.ceil(GetVehicleHandlingFloat(currentDisplayVehicle, 'CHandlingData', 'fSteeringLock') * 1.7),
			dealerBuyPercentage = Config.ResellPercentage
		})

		SetVehicleOnGroundProperly(currentDisplayVehicle)
	end, Config.ShopInside, false)
end)

function DeleteDisplayVehicleInsideShop()
	local attempt = 0
	if DoesEntityExist(currentDisplayVehicle) then
		while DoesEntityExist(currentDisplayVehicle) and not NetworkHasControlOfEntity(currentDisplayVehicle) and attempt < 100 do
			Citizen.Wait(1)
			NetworkRequestControlOfEntity(currentDisplayVehicle)
			attempt = attempt + 1
		end

		if DoesEntityExist(currentDisplayVehicle) and NetworkHasControlOfEntity(currentDisplayVehicle) then
			QBCore.Functions.DeleteVehicle(currentDisplayVehicle)
		end
	end
	currentDisplayVehicle = nil
end

RegisterNUICallback('rightClick', function(data, cb)
	SetNuiFocus(false, false)
	while true do
		Citizen.Wait(1)
		if IsDisabledControlJustPressed(0, 91) then
			break
		end
	end
	SetNuiFocus(true, true)
	cb("")
end)

RegisterNUICallback('closeMenu', function(data, cb)
	closeMenu(data.buy, data.test)
	SetNuiFocus(false,false)
end)

function closeMenu(buy, test)
	local playerPed = PlayerPedId()
	TriggerEvent("tgiann-modernHud:ui", true)
	DeleteDisplayVehicleInsideShop()
	SetNuiFocus(false, false)
	FreezeEntityPosition(playerPed, false)
	SetEntityVisible(playerPed, true)
	if not buy and not test then
		SetEntityCoords(playerPed, playerLastCoord)
		SetEntityHeading(playerPed, playerLastHeading)
		ClearPedTasksImmediately(playerPed)
	end
	IsInShopMenu = false
end

local carcolor = nil

RegisterNUICallback("carColor", function(data, cb)
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped)
	carcolor = data.id
    SetVehicleColours(vehicle, carcolor, carcolor)
    cb(true)
end)


RegisterNUICallback('buyCar', function(data, cb)
	local playerPed = PlayerPedId()
	local selectedCarData = data
	if inSuleyman then
		QBCore.Functions.TriggerCallback('tgiann-vehicleshop:suleymanDurum', function(suleymanDurumu)
			QBCore.Functions.TriggerCallback('ra1derBase:CardealerCount', function(aktifGalerici)
				if QBCore.Functions.IsSpawnPointClear(vector3(Config.BuyCoord.x, Config.BuyCoord.y, Config.BuyCoord.z), 3.0) then 
					if suleymanDurumu then
						if aktifGalerici == 0 then 
							QBCore.Functions.TriggerCallback('tgiann-vehicleshop:buyVehicle', function(success)
								if success then
									DeleteDisplayVehicleInsideShop()
									QBCore.Functions.SpawnVehicle(selectedCarData.selectedCar.carModel, function(vehicle)
										local plate = GeneratePlate()
										local vehicleProps = {}
										SetVehicleColours(vehicle, carcolor, carcolor)
										vehicleProps.plate = plate
										QBCore.Functions.SetVehicleProperties(vehicle, vehicleProps)
										TriggerServerEvent('tgiann-vehicleshop:setVehicleOwned', QBCore.Functions.GetVehicleProperties(vehicle), selectedCarData.selectedCar.carModel, selectedCarData.selectedCar.carName, vehicle)
										TriggerEvent("x-hotwire:give-keys", vehicle)
										TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
									end, Config.BuyCoord, true)
									cb("")
								end
							end, selectedCarData.selectedCar.carModel, selectedCarData.selectedCar.class, GetHashKey(selectedCarData.selectedCar.carModel))
						else
							SendNUIMessage({type = 'notif', text = "Şehirde Aktif Galerici Olduğu İçin Süleyman'dan Araç Satın Alamazsın"})
						end
					else
						SendNUIMessage({type = 'notif', text = 'Galeri Sahibi Tarafından Galerici Süleyman Mesai Dışına Çıkarıldı'})
					end
				else
					SendNUIMessage({type = 'notif', text = "Yakınlardaki Araç Yüzünden Araç Satın Alınamıyor!"})
				end
			end)					
		end)
	else
		QBCore.Functions.TriggerCallback('tgiann-vehicleshop:getCommercialVehicles', function(vehicles)
			if #vehicles < 2 then
				QBCore.Functions.TriggerCallback('tgiann-vehicleshop:buyCarDealerVehicle', function(success)
					if success then
						DeleteDisplayVehicleInsideShop()
						SetEntityCoords(PlayerPedId(), playerLastCoord)
						SetEntityHeading(PlayerPedId(), playerLastHeading)
						QBCore.Functions.Notify("Bir araç satın aldın")
						cb("")
					else
						SendNUIMessage({type = 'notif', text = "Şirket hesabınızda yeterli para yok"})
					end
				end, selectedCarData.selectedCar.carModel, selectedCarData.selectedCar.class, GetHashKey(selectedCarData.selectedCar.carModel))
			else
				SendNUIMessage({type = 'notif', text = "Araç Stoğuna Maksimum 2 Araç Koyabilirsin"})
			end
		end)
	end
end)

RegisterNetEvent("aracfullebebek", function()
    QBCore.Functions.TriggerCallback('tgiann-vehicleshop:AracFulleme', function(sonuc)
        exports['qb-menu']:openMenu({
            {
                header = "Aracın Motor/Fren/Süspansiyon/Turbo Özelliklerini Yükselterek Kullanmak İster Misiniz?",
                txt = "",
                icon = "fas fa-warehouse",
                isMenuHeader = true,
            },
            {
                header = "Evet | -1000$",
                txt = "",
                params = {
                    functions = function()
                        if sonuc then 
                           aracifulle()
                        else
                            QBCore.Functions.Notify("Yeteri Kadar Paran Yok!", 10000)
                        end
                    end
                }
            },
            {
                header = "Hayır, İstemiyorum",
                txt = "",
                params = {
                    event = "qb-menu:closeMenu"
                }
            },
        })
    end)
end)

function aracifulle()
	local vehicle = GetVehiclePedIsIn(PlayerPedId())
	PerformanceUpgradeVehicle(vehicle)
	QBCore.Functions.Notify("Aracınızın Tüm Özellikleri Yükseltildi, 50 Saniye Boyunca Aracınızı En Yüksek Özelliklerde Kullanabileceksiniz.")
end

local performanceModIndices = { 11, 12, 13, 15, 16 }
function PerformanceUpgradeVehicle(vehicle, customWheels)
    customWheels = customWheels or false
    local max
    if DoesEntityExist(vehicle) and IsEntityAVehicle(vehicle) then
        SetVehicleModKit(vehicle, 0)
        for _, modType in ipairs(performanceModIndices) do
            max = GetNumVehicleMods(vehicle, tonumber(modType)) - 1
            SetVehicleMod(vehicle, modType, max, customWheels)
        end
        ToggleVehicleMod(vehicle, 18, true) -- Turbo
	SetVehicleFixed(vehicle)
    end
end


RegisterNUICallback('testCar', function(selectedCarData, cb)
	if QBCore.Functions.IsSpawnPointClear(vector3(Config.BuyCoord.x, Config.BuyCoord.y, Config.BuyCoord.z), 3.0) then 
		local playerPed = PlayerPedId()
		local time = 40
		local spawnedVehicle = nil
		Citizen.CreateThread(function()
			QBCore.Functions.Notify(time.." Saniyelik Test Sürüşü Başladı!")
			TriggerServerEvent("tgiann-vehicleshop:testPrice")
			-- TriggerEvent("aracfullebebek")
			while true do
				Citizen.Wait(1000)
				time = time - 1
				QBCore.Functions.Notify(time, "primary", 800)

				if time == 0 then
					break
				end
			end
		end)

		Citizen.CreateThread(function()
			while time > 0 do
				Citizen.Wait(0)
				DisablePlayerFiring(playerPed, true)
				DisableControlAction(0,21,true) -- disable sprint
				DisableControlAction(0, 24, true) -- Attack
				DisableControlAction(0, 257, true) -- Attack 2
				DisableControlAction(0, 25, true) -- Aim
				DisableControlAction(0, 263, true) -- Melee Attack 1
				DisableControlAction(0, 37, true) -- Select Weapon
				DisableControlAction(0, 56, true) -- F9
				DisableControlAction(0, 45, true) -- Reload
				DisableControlAction(0, 22, true) -- Jump
				DisableControlAction(0, 44, true) -- Cover
				DisableControlAction(0, 288, true) --F1
				DisableControlAction(0, 289, true) -- F2
				DisableControlAction(0, 170, true) -- F3
				DisableControlAction(0, 167, true) -- F6
				DisableControlAction(0, 26, true) -- Disable looking behind
				DisableControlAction(0, 73, true) -- Disable clearing animation
				DisableControlAction(2, 21, true) -- Disable going stealth
				DisableControlAction(0, 47, true)  -- Disable weapon
				DisableControlAction(0, 264, true) -- Disable melee
				DisableControlAction(0, 257, true) -- Disable melee
				DisableControlAction(0, 140, true) -- Disable melee
				DisableControlAction(0, 141, true) -- Disable melee
				DisableControlAction(0, 142, true) -- Disable melee
				DisableControlAction(0, 143, true) -- Disable melee
				DisableControlAction(0, 75, true)  -- Disable exit vehicle
				DisableControlAction(0, 301, true)  -- Disable exit vehicle
				DisableControlAction(27, 75, true) -- Disable exit vehicle
				DisableControlAction(0, 75, true) -- Disable exit vehicle
				DisableControlAction(0, 23, true)
				TaskWarpPedIntoVehicle(PlayerPedId(), spawnedVehicle, -1)
			end
			QBCore.Functions.DeleteVehicle(spawnedVehicle)
			SetEntityCoords(playerPed, Config.denemenoktabitis.x, Config.denemenoktabitis.y, Config.denemenoktabitis.z)
		end)

		QBCore.Functions.SpawnVehicle(selectedCarData.selectedCar.carModel, function (vehicle)
			spawnedVehicle = vehicle
			local vehicleProps = {}
			vehicleProps.plate = "TESTCAR"
			QBCore.Functions.SetVehicleProperties(spawnedVehicle, vehicleProps)
			TriggerEvent("x-hotwire:give-keys", spawnedVehicle)
			TaskWarpPedIntoVehicle(PlayerPedId(), spawnedVehicle, -1)
			cb("")
		end, Config.denemenokta, true)
	else
		SendNUIMessage({type = 'notif', text = "Yakınlardaki Araç Yüzünden Test Sürüşü Başlatılamıyor!"})
	end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
	whenStarted()
end)


RegisterCommand("galerifix", function()
    local playerPed = PlayerPedId()
    local enterCoord = vector3(-34.68, -1105.38, 26.42)
    local enterCoordH = 64.1
    if #(GetEntityCoords(playerPed) - vector3(-74.63, -820.3, 284.0)) < 40.0 then
        Wait(50)
        DoScreenFadeOut(500)
        Wait(1500)
        SendNUIMessage({
            action = 'closeMenu',
            -- buy = buy,
            -- test = test
        })
        SetEntityCoords(playerPed, enterCoord.x, enterCoord.y, enterCoord.z)
        SetEntityHeading(playerPed, enterCoordH)
        SetNuiFocus(false,false)
        QBCore.UI.Menu.CloseAll()
        FreezeEntityPosition(PlayerPedId(), false)
        SetEntityVisible(PlayerPedId(), true) 
        ClearPedTasksImmediately(playerPed)
        DeleteDisplayVehicleInsideShop()
        Wait(500)
        DoScreenFadeIn(500)
    else
        exports["ra1derBase"]:SendAlert('Bu lokasyondan bu komutu kullanamazsın', "primary", 5000)
    end
end)


AddEventHandler("myresource:closeMenu", function(buy, test)
    -- NUI mesajını gönderme
    SendNUIMessage({
        action = 'closeMenu',
        buy = buy,
        test = test
    })
end)


